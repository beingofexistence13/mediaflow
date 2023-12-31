// Sets up the API process, including express server.
// Sets up necessary event proxies.

process.title = 'aggie-api';

var childProcess = require('./child-process');
var path = require('path');
var fs = require('fs');
var logger = require('./logger');
var config = require('../config/secrets');
var ejs = require('ejs');
var exec = require('child_process').exec;
var mailer = require('./mailer.js');
var _ = require("underscore");
var readLineSync = require('readline-sync');
var { version: packageVersion } = require("../package.json");
// Extend global error class
require('./error');

// Get full path for certificate files
var keyFile = path.resolve(__dirname, '../config/key.pem');
var certFile = path.resolve(__dirname, '../config/cert.pem');

// Start express server
var express = require('express');
var app = express();
// We default to https protocol, if certs are not found fallback to http
try {
  cert = fs.readFileSync(certFile);
} catch (e) {
  if (e.code === 'ENOENT') {
    cert = null;
  } else {
    throw e;
  }
}


var protocol;
var server;
if (cert) {
  protocol = 'https';
  try {
    // No passphrase when cert is generated with -nodes
    server = require('https').createServer({
      key: fs.readFileSync(keyFile),
      cert: cert,
    }, app);
  } catch {
    // Prompts for passphrase
    var passphrase = readLineSync.question("Enter PEM passphrase: ", {hideEchoBack: true})
    try {
        server = require('https').createServer({
          key: fs.readFileSync(keyFile),
          cert: cert,
          passphrase: passphrase
        }, app);
    } catch (error) {
      console.log('Wrong passphrase');
    }
  }
} else {
  protocol = 'http';
  server = require('http').createServer(app);
}

// Handle request time outs, return 500 in case of timeouts
function handleRequestTimeouts(req, res, next) {
  var requestTimeout = parseInt(config.get().api_request_timeout) * 1000;

  // exit if disabled
  if (requestTimeout <= 0) return next();

  var timeoutId = setTimeout(function() {
    // timeout has happened, something bad has happened, send 500 back
    logger.error('Timeout has occurred, request cannot be processed', { url: req.url });

    res.send(500);
  }, requestTimeout);

  var end = res.end;
  res.end = function(chunk, encoding) {
    clearTimeout(timeoutId);

    if (!res.headersSent) {
      res.end = end;
      res.end(chunk, encoding);
    }
  };

  next();
}

// Log incoming api requests
function logRequests(req, res, next) {
  var requestLoggingEnabled = !!(config.get().logger.api.log_requests);
  var responseLoggingEnabled = !!(config.get().logger.api.log_responses);

  if (!requestLoggingEnabled && !responseLoggingEnabled) return next();

  var start = new Date();
  var clientIP = req.clientIP;
  var requestId = Math.floor((Math.random() * 1000000));

  if (requestLoggingEnabled) {
    logger.debug(`>>>> [${requestId}, ${clientIP}] ${req.method} ${req.url}`);
  }

  if (responseLoggingEnabled) {
    var end = res.end;
    res.end = function(chunk, encoding) {
      res.end = end;
      var duration = new Date() - start;
      logger.debug(`>>>> [${requestId}, ${clientIP}] ${req.method} ${req.url} ${req.statusCode} ${duration}ms`);
      if (chunk) {
        logger.debug('RESPONSE {0}', chunk);
      }
      res.end(chunk, encoding);
    };
  }

  next();
}

// Add single-page app router
app.use(require('express-spa-router')(app, {
  ignore: ['widget', 'api', 'explorer', 'session', 'logout', 'images'],
  staticPaths: ['js', 'css', 'templates', 'translations'],
  noRoute: function(req, res, next) {
    req.url = '/';
    req.originalUrl = '/';
    return next();
  }
}));

// Add middleware
require('./api/language-cookie.js')(app);

// Enable user authentication and authorization
var auth = require('./api/authentication')(app);
var resetPassword = require('./api/reset-password')(app, auth);
var user = require('./api/authorization')(app, auth);

// setup api logging
app.all('/api/*', express.logger('dev'));

// setup request timeout
app.all('/api/*', handleRequestTimeouts);

// logging middleware
app.all('/api/*', logRequests);

// Ensure that all API calls but public ones are authenticated
app.all('/api/v1/public/*', auth.skipAuthentication);
app.all('/api/*', auth.ensureAuthenticated);


// Add all API controllers

var settingsController = require('./api/v1/settings-controller');
app.use(settingsController);

require('./api/v1/incident-controller')(app, user);
require('./api/v1/report-controller')(app, user);
require('./api/v1/source-controller')(app, user);
require('./api/v1/tag-controller')(app, user);
require('./api/v1/ct-list-controller')(app, user);
require("./api/v1/visualization-controller")(app, user);
require("./api/v1/credentials-controller")(app, user);
require("./api/v1/csv-controller")(app, user);

var trendController = require('./api/v1/trend-controller')(app, user);

require('./api/v1/user-controller')(app, user);

var publicController = require('./api/v1/public-controller');
app.use(publicController);

require('./api/v1/widget-controller')(app);

var SocketHandler = require('./api/socket-handler');
var socketHandler = new SocketHandler(app, server, auth);
var streamer = require('./api/streamer');

// Create event proxy between trend controller and trend master
trendController.addListeners('trendMaster', childProcess.setupEventProxy({
  emitter: '/lib/analytics/trend-master',
  emitterModule: 'analytics'
}));

// Create event proxy between other modules and streamer
streamer.addListeners('report', childProcess.setupEventProxy({
  emitter: '/models/report',
  subclass: 'schema',
  emitterModule: 'fetching'
}));
socketHandler.addListeners('source', childProcess.setupEventProxy({
  emitter: '/models/source',
  subclass: 'schema',
  emitterModule: 'fetching'
}));
socketHandler.addListeners('trends', childProcess.setupEventProxy({
  emitter: '/lib/analytics/trend-master',
  emitterModule: 'analytics'
}));
socketHandler.addListeners('stats', childProcess.setupEventProxy({
  emitter: '/lib/analytics/stats-master',
  emitterModule: 'analytics'
}));

// Defer local listeners until inter-process listeners have been set up to avoid binding conflicts
setTimeout(function() {
  socketHandler.addListeners('sourceLocal', require('../models/source').schema);
  socketHandler.addListeners('report', require('../models/report').schema);
  socketHandler.addListeners('tag', require('../models/tag').schema);
  streamer.addListeners('incident', require('../models/incident').schema);
  // Add listener to reload config and emit event to mailer
  settingsController.addListener('settingsUpdated', function(arguments) {
    config.get({ reload: true });
    switch (arguments.setting) {
    case 'email:transport':
      _.bind(mailer.reloadTransport, mailer)();
      break;
    case 'email':
      _.bind(mailer.reloadConfig, mailer)();
      break;
    }
  });
}, 500);

// Add CRON job for updating CrowdTangle List
app.use(require('./cron/ct-list-update'));



// The API explorer is a client-side thing so it's loaded as static.
app.use('/explorer', express.static(path.join(__dirname, '../public/explorer')));

// Exposed shared classes to the client
app.use('/shared', express.static(path.join(__dirname, '../shared')));
app.use('/client', express.static(path.join(__dirname, '../client')));

// use ejs templating
app.engine('html', ejs.renderFile);

// get git version
var version;
exec('git rev-parse --short HEAD', function(err, stdout, stderr) {
  if (err) {
    logger.warning(err);
  }
  version = `v${packageVersion}-${stdout.trim()}`;
  logger.info('✔ Aggie version: ' + version);
});

// views directory (defaults to /views)
app.set('views', __dirname + '/../public/angular');

// root route
app.use('/', function(req, res, next) {
  if (req.originalUrl === '/') {
    // Inject git describe version and Google Places token if index.html
    res.render('index.html', { version: version, gPlacesKey: config.get().gplaces.key });
  } else {
    // Load single-page app statically from root path
    express.static(path.join(__dirname, '../public/angular'))(req, res, next);
  }
});

// handle all errors and log them
process.on('uncaughtException', function(err) {
  logger.error(err);
});
app.use(function(err, req, res, next) {
  if (err) {
    logger.error(err);
    res.send(500);
  }
  else {
    next();
  }
});

// Listen for API in a different port
app.set('port', process.env.PORT || 3000);

server.listen(app.get('port'), function() {
  logger.info('✔ Aggie is listening on port ' + app.get('port'));
  logger.info('✔ Aggie is listening to protocol ' + protocol);
});

module.exports = childProcess;
module.exports.app = app;
