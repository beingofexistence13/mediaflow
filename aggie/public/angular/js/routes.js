angular.module('Aggie')

.config([
  '$stateProvider',
  function($stateProvider) {
    var lastAnalysis;

    $stateProvider.state('home', {
      url: '/',
      onEnter: function($state) {
        $state.go('reports');
      },
      data: {
        public: true
      }
    });

    $stateProvider.state('profile', {
      url: '/profile/:userName',
      templateUrl: '/templates/users/profile.html',
      controller: 'UsersProfileController',
      resolve: {
        users: ['User', function(User) {
          return User.query().$promise;
        }]
      }
    });

    $stateProvider.state('login', {
      url: '/login',
      templateUrl: '/templates/login.html',
      controller: 'LoginController',
      data: {
        public: true
      }
    });

    $stateProvider.state('reset_admin_password', {
      url: '/reset_admin_password',
      templateUrl: '/templates/reset-admin-password.html',
      controller: 'ResetAdminPasswordController'
    });

    $stateProvider.state('reports', {
      url: '/reports?keywords&page&before&after&sourceId&status&media&incidentId&author&tags&list',
      templateUrl: '/templates/reports/index.html',
      controller: 'ReportsIndexController',
      resolve: {
        reports: ['Report', '$stateParams', function(Report, params) {
          var page = params.page || 1;
          return Report.query({
            page: page - 1,
            keywords: params.keywords,
            after: params.after,
            before: params.before,
            sourceId: params.sourceId,
            media: params.media,
            incidentId: params.incidentId,
            status: params.status,
            author: params.author,
            tags: params.tags,
            list: params.list,
            isRelevantReports: false,
          }).$promise;
        }],
        ctLists: ['CTLists', function(CTLists) {
          return CTLists.get().$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }]
      }
    });
    $stateProvider.state('relevant_reports', {
      url: '/relevant_reports?keywords&page&before&after&sourceId&status&media&incidentId&author&tags&list&escalated&veracity',
      templateUrl: '/templates/reports/relevant_reports.html',
      controller: 'RelevantReportsIndexController',
      resolve: {
        reports: ['Report', '$stateParams', function(Report, params) {
          var page = params.page || 1;
          return Report.query({
            page: page - 1,
            keywords: params.keywords,
            after: params.after,
            before: params.before,
            sourceId: params.sourceId,
            media: params.media,
            incidentId: params.incidentId,
            status: params.status,
            author: params.author,
            tags: params.tags,
            list: params.list,
            escalated: params.escalated,
            veracity: params.veracity,
            isRelevantReports: true,
          }).$promise;
        }],
        ctLists: ['CTLists', function(CTLists) {
          return CTLists.get().$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }]
      }
    });
    $stateProvider.state('batch', {
      url: '/reports/batch?keywords&before&after&sourceId&status&media&incidentId&author&tags&list',
      templateUrl: '/templates/reports/batch.html',
      controller: 'ReportsIndexController',
      resolve: {
        reports: ['Batch', function(Batch) {
          if (Batch.resource) return Batch.resource;
          return Batch.load({}).$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }],
        ctLists: ['CTLists', function(CTLists) {
          return CTLists.get().$promise;
        }],
      },
    });

    $stateProvider.state('report', {
      url: '/reports/:id?page',
      templateUrl: '/templates/reports/show.html',
      controller: 'ReportsShowController',
      resolve: {
        data: ['$stateParams', '$q', 'Report', 'Source', function($stateParams, $q, Report, Source) {
          var deferred = $q.defer();
          Report.get({ id: $stateParams.id }, function(report) {
            report.content = Autolinker.link(report.content);
            var data = { report: report };

            var sourcePromises = report._sources.map(function(sourceId) {
              var promise = $q.defer();
              Source.get({ id: sourceId }, function(source) {
                promise.resolve(source);
              });
              return promise.promise;
            });

            $q.all(sourcePromises).then(function(sources) {
              data.sources = sources;
              deferred.resolve(data);
            });
          });

          return deferred.promise;
        }],
        comments: ['Report', '$stateParams', function(Report, params) {
          var page = params.page || 1;
          return Report.queryComments({
            id: params.id,
            page: page - 1,
          }).$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
      }
    });


    $stateProvider.state('incidents', {
      url: '/incidents?page&title&locationName&assignedTo&status&veracity&tags&escalated&public&before&after&idnum&creator',
      templateUrl: '/templates/incidents/index.html',
      controller: 'IncidentsIndexController',
      resolve: {
        incidents: ['Incident', '$stateParams', function(Incident, params) {
          var page = params.page || 1;
          return Incident.query({
            page: page - 1,
            title: params.title,
            locationName: params.locationName,
            assignedTo: params.assignedTo,
            status: params.status,
            veracity: params.veracity,
            tags: params.tags,
            escalated: params.escalated,
            public: params.public,
            after: params.after,
            before: params.before,
            idnum: (params.idnum == null) ? params.idnum: params.idnum -1,
            creator: params.creator,
          }).$promise;
        }],
        users: ['User', function(User) {
          return User.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }]
      }
    });

    $stateProvider.state('incident', {
      url: '/incidents/:id?page',
      templateUrl: '/templates/incidents/show.html',
      controller: 'IncidentsShowController',
      resolve: {
        incident: ['Incident', '$stateParams', function(Incident, params) {
          return Incident.get({ id: params.id }).$promise;
        }],
        reports: ['Report', '$stateParams', function(Report, params) {
          var page = params.page || 1;
          return Report.query({
            incidentId: params.id,
            page: page - 1
          }).$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }]
      }
    });

    $stateProvider.state('credentials', {
      url: '/credentials',
      templateUrl: '/templates/credentials/index.html',
      controller: 'CredentialsIndexController',
      resolve: {
        credentials: ['Credentials', function(Credentials) {
          return Credentials.query().$promise;
        }]
      }
    });

    $stateProvider.state('credential', {
      url: '/credentials/:id',
      templateUrl: '/templates/credentials/show.html',
      controller: 'CredentialsShowController',
      resolve: {
        credentials: ['Credentials', '$stateParams', function(Credentials, params) {
          return Credentials.get({ id: params.id }).$promise;
        }],
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
      }
    });

    $stateProvider.state('sources', {
      url: '/sources',
      templateUrl: '/templates/sources/index.html',
      controller: 'SourcesIndexController',
      resolve: {
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
      }
    });

    $stateProvider.state('source', {
      url: '/sources/:id',
      templateUrl: '/templates/sources/show.html',
      controller: 'SourcesShowController',
      resolve: {
        source: ['Source', '$stateParams', function(Source, params) {
          return Source.get({ id: params.id }).$promise;
        }],
      }
    });

    $stateProvider.state('users', {
      url: '/users',
      templateUrl: '/templates/users/index.html',
      controller: 'UsersIndexController',
      resolve: {
        users: ['User', function(User) {
          return User.query().$promise;
        }]
      }
    });

    $stateProvider.state('tags', {
      url: '/tags',
      templateUrl: '/templates/tags/index.html',
      controller: 'TagsIndexController',
      resolve: {
        smtcTags: ['SMTCTag', function(SMTCTag) {
          return SMTCTag.query().$promise;
        }]
      }
    });

    $stateProvider.state("analysis", {
      url: "/analysis",
      templateUrl: "/templates/analysis/index.html",
      controller: "AnalysisController",
      resolve: {
        data: [
          "Visualization",
          function (Visualization) {
            return Visualization.get().$promise;
          },
        ],
      },
    });

    $stateProvider.state('lastAnalysis', {
      onEnter: function($state) {
        if (!lastAnalysis) {
          lastAnalysis = 'analysis.trend-lines';
        }
        $state.go(lastAnalysis);
      }
    });

    $stateProvider.state('analysis.trend-lines', {
      url: '/trend-lines',
      templateUrl: '/templates/trends/lines.html',
      controller: 'TrendsLinesController',
      onEnter: function($state) {
        lastAnalysis = 'analysis.trend-lines';
      },
      resolve: {
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        trends: ['Trend', function(Trend) {
          return Trend.query().$promise;
        }]
      }
    });

    $stateProvider.state('analysis.trend-bars', {
      url: '/trend-bars',
      templateUrl: '/templates/trends/bars.html',
      controller: 'TrendsBarsController',
      onEnter: function($state) {
        lastAnalysis = 'analysis.trend-bars';
      },
      resolve: {
        sources: ['Source', function(Source) {
          return Source.query().$promise;
        }],
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }],
        trends: ['Trend', function(Trend) {
          return Trend.query().$promise;
        }]
      }
    });

    $stateProvider.state('analysis.incidentsMap', {
      url: '/incidents-map',
      onEnter: function($state) {
        lastAnalysis = 'analysis.incidentsMap';
      },
      templateUrl: '/templates/incidents/map.html',
      controller: 'IncidentsMapController',
      resolve: {
        incidents: ['Incident', function(Incident) {
          return Incident.query().$promise;
        }]
      }
    });

    $stateProvider.state('config', {
      url: '/config',
      templateUrl: '/templates/config.html',
      controller: 'SettingsController'
    });

    $stateProvider.state('password_reset', {
      url: '/password_reset/:token',
      templateUrl: '/templates/password_reset.html',
      controller: 'PasswordResetController',
      data: {
        public: true
      }
    });

    $stateProvider.state('choose_password', {
      url: '/choose_password/:token',
      templateUrl: '/templates/choose_password.html',
      controller: 'ChoosePasswordController',
      data: {
        public: true
      }
    });

    $stateProvider.state('404', {
      url: '/404',
      templateUrl: '/templates/404.html',
      data: {
        public: true
      }
    });
  }
]);
