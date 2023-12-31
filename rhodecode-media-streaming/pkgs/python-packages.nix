{
  Babel = super.buildPythonPackage {
    name = "Babel-1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytz];
    src = fetchurl {
      url = "https://pypi.python.org/packages/33/27/e3978243a03a76398c384c83f7ca879bc6e8f1511233a621fcada135606e/Babel-1.3.tar.gz";
      md5 = "5264ceb02717843cbc9ffce8e6e06bdb";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Beaker = super.buildPythonPackage {
    name = "Beaker-1.7.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/97/8e/409d2e7c009b8aa803dc9e6f239f1db7c3cdf578249087a404e7c27a505d/Beaker-1.7.0.tar.gz";
      md5 = "386be3f7fe427358881eee4622b428b3";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  CProfileV = super.buildPythonPackage {
    name = "CProfileV-1.0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [bottle];
    src = fetchurl {
      url = "https://pypi.python.org/packages/eb/df/983a0b6cfd3ac94abf023f5011cb04f33613ace196e33f53c86cf91850d5/CProfileV-1.0.6.tar.gz";
      md5 = "08c7c242b6e64237bc53c5d13537e03d";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Fabric = super.buildPythonPackage {
    name = "Fabric-1.10.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [paramiko];
    src = fetchurl {
      url = "https://pypi.python.org/packages/e3/5f/b6ebdb5241d5ec9eab582a5c8a01255c1107da396f849e538801d2fe64a5/Fabric-1.10.0.tar.gz";
      md5 = "2cb96473387f0e7aa035210892352f4a";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  FormEncode = super.buildPythonPackage {
    name = "FormEncode-1.2.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8e/59/0174271a6f004512e0201188593e6d319db139d14cb7490e488bbb078015/FormEncode-1.2.4.tar.gz";
      md5 = "6bc17fb9aed8aea198975e888e2077f4";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  Jinja2 = super.buildPythonPackage {
    name = "Jinja2-2.7.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b0/73/eab0bca302d6d6a0b5c402f47ad1760dc9cb2dd14bbc1873ad48db258e4d/Jinja2-2.7.3.tar.gz";
      md5 = "b9dffd2f3b43d673802fe857c8445b1a";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Mako = super.buildPythonPackage {
    name = "Mako-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8e/a4/aa56533ecaa5f22ca92428f74e074d0c9337282933c722391902c8f9e0f8/Mako-1.0.1.tar.gz";
      md5 = "9f0aafd177b039ef67b90ea350497a54";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Markdown = super.buildPythonPackage {
    name = "Markdown-2.6.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/62/8b/83658b5f6c220d5fcde9f9852d46ea54765d734cfbc5a9f4c05bfc36db4d/Markdown-2.6.2.tar.gz";
      md5 = "256d19afcc564dc4ce4c229bb762f7ae";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  MarkupSafe = super.buildPythonPackage {
    name = "MarkupSafe-0.23";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      md5 = "f5ab3deee4c37cd6a922fb81e730da6e";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  MySQL-python = super.buildPythonPackage {
    name = "MySQL-python-1.2.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a5/e9/51b544da85a36a68debe7a7091f068d802fc515a3a202652828c73453cad/MySQL-python-1.2.5.zip";
      md5 = "654f75b302db6ed8dc5a898c625e030c";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl1 ];
    };
  };
  Paste = super.buildPythonPackage {
    name = "Paste-2.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d5/8d/0f8ac40687b97ff3e07ebd1369be20bdb3f93864d2dc3c2ff542edb4ce50/Paste-2.0.2.tar.gz";
      md5 = "4bfc8a7eaf858f6309d2ac0f40fc951c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  PasteDeploy = super.buildPythonPackage {
    name = "PasteDeploy-1.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz";
      md5 = "352b7205c78c8de4987578d19431af3b";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  PasteScript = super.buildPythonPackage {
    name = "PasteScript-1.7.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Paste PasteDeploy];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a5/05/fc60efa7c2f17a1dbaeccb2a903a1e90902d92b9d00eebabe3095829d806/PasteScript-1.7.5.tar.gz";
      md5 = "4c72d78dcb6bb993f30536842c16af4d";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Pygments = super.buildPythonPackage {
    name = "Pygments-2.1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz";
      md5 = "ed3fba2467c8afcda4d317e4ef2c6150";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Pylons = super.buildPythonPackage {
    name = "Pylons-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Routes WebHelpers Beaker Paste PasteDeploy PasteScript FormEncode simplejson decorator nose Mako WebError WebTest Tempita MarkupSafe WebOb];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a2/69/b835a6bad00acbfeed3f33c6e44fa3f936efc998c795bfb15c61a79ecf62/Pylons-1.0.1.tar.gz";
      md5 = "6cb880d75fa81213192142b07a6e4915";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Pyro4 = super.buildPythonPackage {
    name = "Pyro4-4.41";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [serpent];
    src = fetchurl {
      url = "https://pypi.python.org/packages/56/2b/89b566b4bf3e7f8ba790db2d1223852f8cb454c52cab7693dd41f608ca2a/Pyro4-4.41.tar.gz";
      md5 = "ed69e9bfafa9c06c049a87cb0c4c2b6c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Routes = super.buildPythonPackage {
    name = "Routes-1.13";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [repoze.lru];
    src = fetchurl {
      url = "https://pypi.python.org/packages/88/d3/259c3b3cde8837eb9441ab5f574a660e8a4acea8f54a078441d4d2acac1c/Routes-1.13.tar.gz";
      md5 = "d527b0ab7dd9172b1275a41f97448783";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  SQLAlchemy = super.buildPythonPackage {
    name = "SQLAlchemy-0.9.9";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/28/f7/1bbfd0d8597e8c358d5e15a166a486ad82fc5579b4e67b6ef7c05b1d182b/SQLAlchemy-0.9.9.tar.gz";
      md5 = "8a10a9bd13ed3336ef7333ac2cc679ff";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Sphinx = super.buildPythonPackage {
    name = "Sphinx-1.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Pygments docutils Jinja2];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0a/50/34017e6efcd372893a416aba14b84a1a149fc7074537b0e9cb6ca7b7abe9/Sphinx-1.2.2.tar.gz";
      md5 = "3dc73ccaa8d0bfb2d62fb671b1f7e8a4";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Tempita = super.buildPythonPackage {
    name = "Tempita-0.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/56/c8/8ed6eee83dbddf7b0fc64dd5d4454bc05e6ccaafff47991f73f2894d9ff4/Tempita-0.5.2.tar.gz";
      md5 = "4c2f17bb9d481821c41b6fbee904cea1";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  URLObject = super.buildPythonPackage {
    name = "URLObject-2.4.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/cb/b6/e25e58500f9caef85d664bec71ec67c116897bfebf8622c32cb75d1ca199/URLObject-2.4.0.tar.gz";
      md5 = "2ed819738a9f0a3051f31dc9924e3065";
    };
    meta = {
      license = [  ];
    };
  };
  WebError = super.buildPythonPackage {
    name = "WebError-0.10.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [WebOb Tempita Pygments Paste];
    src = fetchurl {
      url = "https://pypi.python.org/packages/35/76/e7e5c2ce7e9c7f31b54c1ff295a495886d1279a002557d74dd8957346a79/WebError-0.10.3.tar.gz";
      md5 = "84b9990b0baae6fd440b1e60cdd06f9a";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  WebHelpers = super.buildPythonPackage {
    name = "WebHelpers-1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ee/68/4d07672821d514184357f1552f2dad923324f597e722de3b016ca4f7844f/WebHelpers-1.3.tar.gz";
      md5 = "32749ffadfc40fea51075a7def32588b";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  WebHelpers2 = super.buildPythonPackage {
    name = "WebHelpers2-2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ff/30/56342c6ea522439e3662427c8d7b5e5b390dff4ff2dc92d8afcb8ab68b75/WebHelpers2-2.0.tar.gz";
      md5 = "0f6b68d70c12ee0aed48c00b24da13d3";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  WebOb = super.buildPythonPackage {
    name = "WebOb-1.3.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/16/78/adfc0380b8a0d75b2d543fa7085ba98a573b1ae486d9def88d172b81b9fa/WebOb-1.3.1.tar.gz";
      md5 = "20918251c5726956ba8fef22d1556177";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  WebTest = super.buildPythonPackage {
    name = "WebTest-1.4.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [WebOb];
    src = fetchurl {
      url = "https://pypi.python.org/packages/51/3d/84fd0f628df10b30c7db87895f56d0158e5411206b721ca903cb51bfd948/WebTest-1.4.3.zip";
      md5 = "631ce728bed92c681a4020a36adbc353";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  Whoosh = super.buildPythonPackage {
    name = "Whoosh-2.7.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1c/dc/2f0231ff3875ded36df8c1ab851451e51a237dc0e5a86d3d96036158da94/Whoosh-2.7.0.zip";
      md5 = "7abfd970f16fadc7311960f3fa0bc7a9";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.bsd2 ];
    };
  };
  alembic = super.buildPythonPackage {
    name = "alembic-0.8.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [SQLAlchemy Mako python-editor];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ca/7e/299b4499b5c75e5a38c5845145ad24755bebfb8eec07a2e1c366b7181eeb/alembic-0.8.4.tar.gz";
      md5 = "5f95d8ee62b443f9b37eb5bee76c582d";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  amqplib = super.buildPythonPackage {
    name = "amqplib-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/75/b7/8c2429bf8d92354a0118614f9a4d15e53bc69ebedce534284111de5a0102/amqplib-1.0.2.tgz";
      md5 = "5c92f17fbedd99b2b4a836d4352d1e2f";
    };
    meta = {
      license = [ { fullName = "LGPL"; } { fullName = "GNU Library or Lesser General Public License (LGPL)"; } ];
    };
  };
  anyjson = super.buildPythonPackage {
    name = "anyjson-0.3.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c3/4d/d4089e1a3dd25b46bebdb55a992b0797cff657b4477bc32ce28038fdecbc/anyjson-0.3.3.tar.gz";
      md5 = "2ea28d6ec311aeeebaf993cb3008b27c";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  appenlight-client = super.buildPythonPackage {
    name = "appenlight-client-0.6.14";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [WebOb requests];
    src = fetchurl {
      url = "https://pypi.python.org/packages/4d/e0/23fee3ebada8143f707e65c06bcb82992040ee64ea8355e044ed55ebf0c1/appenlight_client-0.6.14.tar.gz";
      md5 = "578c69b09f4356d898fff1199b98a95c";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "DFSG approved"; } ];
    };
  };
  authomatic = super.buildPythonPackage {
    name = "authomatic-0.1.0.post1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/08/1a/8a930461e604c2d5a7a871e1ac59fa82ccf994c32e807230c8d2fb07815a/Authomatic-0.1.0.post1.tar.gz";
      md5 = "be3f3ce08747d776aae6d6cc8dcb49a9";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  backport-ipaddress = super.buildPythonPackage {
    name = "backport-ipaddress-0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d3/30/54c6dab05a4dec44db25ff309f1fbb6b7a8bde3f2bade38bb9da67bbab8f/backport_ipaddress-0.1.tar.gz";
      md5 = "9c1f45f4361f71b124d7293a60006c05";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  bottle = super.buildPythonPackage {
    name = "bottle-0.12.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/52/df/e4a408f3a7af396d186d4ecd3b389dd764f0f943b4fa8d257bfe7b49d343/bottle-0.12.8.tar.gz";
      md5 = "13132c0a8f607bf860810a6ee9064c5b";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  bumpversion = super.buildPythonPackage {
    name = "bumpversion-0.5.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/14/41/8c9da3549f8e00c84f0432c3a8cf8ed6898374714676aab91501d48760db/bumpversion-0.5.3.tar.gz";
      md5 = "c66a3492eafcf5ad4b024be9fca29820";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  celery = super.buildPythonPackage {
    name = "celery-2.2.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [python-dateutil anyjson kombu pyparsing];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b1/64/860fd50e45844c83442e7953effcddeff66b2851d90b2d784f7201c111b8/celery-2.2.10.tar.gz";
      md5 = "898bc87e54f278055b561316ba73e222";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  click = super.buildPythonPackage {
    name = "click-5.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b7/34/a496632c4fb6c1ee76efedf77bb8d28b29363d839953d95095b12defe791/click-5.1.tar.gz";
      md5 = "9c5323008cccfe232a8b161fc8196d41";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  colander = super.buildPythonPackage {
    name = "colander-1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [translationstring iso8601];
    src = fetchurl {
      url = "https://pypi.python.org/packages/14/23/c9ceba07a6a1dc0eefbb215fc0dc64aabc2b22ee756bc0f0c13278fa0887/colander-1.2.tar.gz";
      md5 = "83db21b07936a0726e588dae1914b9ed";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  configobj = super.buildPythonPackage {
    name = "configobj-5.0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz";
      md5 = "e472a3a1c2a67bb0ec9b5d54c13a47d6";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  cov-core = super.buildPythonPackage {
    name = "cov-core-1.15.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [coverage];
    src = fetchurl {
      url = "https://pypi.python.org/packages/4b/87/13e75a47b4ba1be06f29f6d807ca99638bedc6b57fa491cd3de891ca2923/cov-core-1.15.0.tar.gz";
      md5 = "f519d4cb4c4e52856afb14af52919fe6";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  coverage = super.buildPythonPackage {
    name = "coverage-3.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/09/4f/89b06c7fdc09687bca507dc411c342556ef9c5a3b26756137a4878ff19bf/coverage-3.7.1.tar.gz";
      md5 = "c47b36ceb17eaff3ecfab3bcd347d0df";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  cssselect = super.buildPythonPackage {
    name = "cssselect-0.9.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/aa/e5/9ee1460d485b94a6d55732eb7ad5b6c084caf73dd6f9cb0bb7d2a78fafe8/cssselect-0.9.1.tar.gz";
      md5 = "c74f45966277dc7a0f768b9b0f3522ac";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  decorator = super.buildPythonPackage {
    name = "decorator-3.4.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/35/3a/42566eb7a2cbac774399871af04e11d7ae3fc2579e7dae85213b8d1d1c57/decorator-3.4.2.tar.gz";
      md5 = "9e0536870d2b83ae27d58dbf22582f4d";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  docutils = super.buildPythonPackage {
    name = "docutils-0.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz";
      md5 = "4622263b62c5c771c03502afa3157768";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.publicDomain pkgs.lib.licenses.gpl1 { fullName = "public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)"; } pkgs.lib.licenses.psfl ];
    };
  };
  dogpile.cache = super.buildPythonPackage {
    name = "dogpile.cache-0.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [dogpile.core];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f6/a0/6f2142c58c6588d17c734265b103ae1cd0741e1681dd9483a63f22033375/dogpile.cache-0.6.1.tar.gz";
      md5 = "35d7fb30f22bbd0685763d894dd079a9";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  dogpile.core = super.buildPythonPackage {
    name = "dogpile.core-0.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0e/77/e72abc04c22aedf874301861e5c1e761231c288b5de369c18be8f4b5c9bb/dogpile.core-0.4.1.tar.gz";
      md5 = "01cb19f52bba3e95c9b560f39341f045";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  dulwich = super.buildPythonPackage {
    name = "dulwich-0.12.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6f/04/fbe561b6d45c0ec758330d5b7f5ba4b6cb4f1ca1ab49859d2fc16320da75/dulwich-0.12.0.tar.gz";
      md5 = "f3a8a12bd9f9dd8c233e18f3d49436fa";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl2Plus ];
    };
  };
  ecdsa = super.buildPythonPackage {
    name = "ecdsa-0.11";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6c/3f/92fe5dcdcaa7bd117be21e5520c9a54375112b66ec000d209e9e9519fad1/ecdsa-0.11.tar.gz";
      md5 = "8ef586fe4dbb156697d756900cb41d7c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  elasticsearch = super.buildPythonPackage {
    name = "elasticsearch-2.3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [urllib3];
    src = fetchurl {
      url = "https://pypi.python.org/packages/10/35/5fd52c5f0b0ee405ed4b5195e8bce44c5e041787680dc7b94b8071cac600/elasticsearch-2.3.0.tar.gz";
      md5 = "2550f3b51629cf1ef9636608af92c340";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  elasticsearch-dsl = super.buildPythonPackage {
    name = "elasticsearch-dsl-2.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six python-dateutil elasticsearch];
    src = fetchurl {
      url = "https://pypi.python.org/packages/4e/5d/e788ae8dbe2ff4d13426db0a027533386a5c276c77a2654dc0e2007ce04a/elasticsearch-dsl-2.0.0.tar.gz";
      md5 = "4cdfec81bb35383dd3b7d02d7dc5ee68";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  flake8 = super.buildPythonPackage {
    name = "flake8-2.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyflakes pep8 mccabe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8f/b5/9a73c66c7dba273bac8758398f060c008a25f3e84531063b42503b5d0a95/flake8-2.4.1.tar.gz";
      md5 = "ed45d3db81a3b7c88bd63c6e37ca1d65";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  future = super.buildPythonPackage {
    name = "future-0.14.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/83/80/8ef3a11a15f8eaafafa0937b20c1b3f73527e69ab6b3fa1cf94a5a96aabb/future-0.14.3.tar.gz";
      md5 = "e94079b0bd1fc054929e8769fc0f6083";
    };
    meta = {
      license = [ { fullName = "OSI Approved"; } pkgs.lib.licenses.mit ];
    };
  };
  futures = super.buildPythonPackage {
    name = "futures-3.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f8/e7/fc0fcbeb9193ba2d4de00b065e7fd5aecd0679e93ce95a07322b2b1434f4/futures-3.0.2.tar.gz";
      md5 = "42aaf1e4de48d6e871d77dc1f9d96d5a";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  gnureadline = super.buildPythonPackage {
    name = "gnureadline-6.3.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3a/ee/2c3f568b0a74974791ac590ec742ef6133e2fbd287a074ba72a53fa5e97c/gnureadline-6.3.3.tar.gz";
      md5 = "c4af83c9a3fbeac8f2da9b5a7c60e51c";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl1 ];
    };
  };
  gprof2dot = super.buildPythonPackage {
    name = "gprof2dot-2015.12.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b9/34/7bf93c1952d40fa5c95ad963f4d8344b61ef58558632402eca18e6c14127/gprof2dot-2015.12.1.tar.gz";
      md5 = "e23bf4e2f94db032750c193384b4165b";
    };
    meta = {
      license = [ { fullName = "LGPL"; } ];
    };
  };
  gunicorn = super.buildPythonPackage {
    name = "gunicorn-19.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/84/ce/7ea5396efad1cef682bbc4068e72a0276341d9d9d0f501da609fab9fcb80/gunicorn-19.6.0.tar.gz";
      md5 = "338e5e8a83ea0f0625f768dba4597530";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  infrae.cache = super.buildPythonPackage {
    name = "infrae.cache-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Beaker repoze.lru];
    src = fetchurl {
      url = "https://pypi.python.org/packages/bb/f0/e7d5e984cf6592fd2807dc7bc44a93f9d18e04e6a61f87fdfb2622422d74/infrae.cache-1.0.1.tar.gz";
      md5 = "b09076a766747e6ed2a755cc62088e32";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };
  invoke = super.buildPythonPackage {
    name = "invoke-0.13.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/47/bf/d07ef52fa1ac645468858bbac7cb95b246a972a045e821493d17d89c81be/invoke-0.13.0.tar.gz";
      md5 = "c0d1ed4bfb34eaab551662d8cfee6540";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  ipdb = super.buildPythonPackage {
    name = "ipdb-0.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [ipython];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f0/25/d7dd430ced6cd8dc242a933c8682b5dbf32eb4011d82f87e34209e5ec845/ipdb-0.8.zip";
      md5 = "96dca0712efa01aa5eaf6b22071dd3ed";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl1 ];
    };
  };
  ipython = super.buildPythonPackage {
    name = "ipython-3.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/06/91/120c0835254c120af89f066afaabf81289bc2726c1fc3ca0555df6882f58/ipython-3.1.0.tar.gz";
      md5 = "a749d90c16068687b0ec45a27e72ef8f";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  iso8601 = super.buildPythonPackage {
    name = "iso8601-0.1.11";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c0/75/c9209ee4d1b5975eb8c2cba4428bde6b61bd55664a98290dd015cdb18e98/iso8601-0.1.11.tar.gz";
      md5 = "b06d11cd14a64096f907086044f0fe38";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  itsdangerous = super.buildPythonPackage {
    name = "itsdangerous-0.24";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz";
      md5 = "a3d55aa79369aef5345c036a8a26307f";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  kombu = super.buildPythonPackage {
    name = "kombu-1.5.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [anyjson amqplib];
    src = fetchurl {
      url = "https://pypi.python.org/packages/19/53/74bf2a624644b45f0850a638752514fc10a8e1cbd738f10804951a6df3f5/kombu-1.5.1.tar.gz";
      md5 = "50662f3c7e9395b3d0721fb75d100b63";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  lxml = super.buildPythonPackage {
    name = "lxml-3.4.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/63/c7/4f2a2a4ad6c6fa99b14be6b3c1cece9142e2d915aa7c43c908677afc8fa4/lxml-3.4.4.tar.gz";
      md5 = "a9a65972afc173ec7a39c585f4eea69c";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  mccabe = super.buildPythonPackage {
    name = "mccabe-0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c9/2e/75231479e11a906b64ac43bad9d0bb534d00080b18bdca8db9da46e1faf7/mccabe-0.3.tar.gz";
      md5 = "81640948ff226f8c12b3277059489157";
    };
    meta = {
      license = [ { fullName = "Expat license"; } pkgs.lib.licenses.mit ];
    };
  };
  meld3 = super.buildPythonPackage {
    name = "meld3-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/45/a0/317c6422b26c12fe0161e936fc35f36552069ba8e6f7ecbd99bbffe32a5f/meld3-1.0.2.tar.gz";
      md5 = "3ccc78cd79cffd63a751ad7684c02c91";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  mock = super.buildPythonPackage {
    name = "mock-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/15/45/30273ee91feb60dabb8fbb2da7868520525f02cf910279b3047182feed80/mock-1.0.1.zip";
      md5 = "869f08d003c289a97c1a6610faf5e913";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  msgpack-python = super.buildPythonPackage {
    name = "msgpack-python-0.4.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/15/ce/ff2840885789ef8035f66cd506ea05bdb228340307d5e71a7b1e3f82224c/msgpack-python-0.4.6.tar.gz";
      md5 = "8b317669314cf1bc881716cccdaccb30";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  nose = super.buildPythonPackage {
    name = "nose-1.3.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/70/c7/469e68148d17a0d3db5ed49150242fd70a74a8147b8f3f8b87776e028d99/nose-1.3.6.tar.gz";
      md5 = "0ca546d81ca8309080fc80cb389e7a16";
    };
    meta = {
      license = [ { fullName = "GNU Library or Lesser General Public License (LGPL)"; } { fullName = "GNU LGPL"; } ];
    };
  };
  objgraph = super.buildPythonPackage {
    name = "objgraph-2.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d7/33/ace750b59247496ed769b170586c5def7202683f3d98e737b75b767ff29e/objgraph-2.0.0.tar.gz";
      md5 = "25b0d5e5adc74aa63ead15699614159c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  packaging = super.buildPythonPackage {
    name = "packaging-15.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/24/c4/185da1304f07047dc9e0c46c31db75c0351bd73458ac3efad7da3dbcfbe1/packaging-15.2.tar.gz";
      md5 = "c16093476f6ced42128bf610e5db3784";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  paramiko = super.buildPythonPackage {
    name = "paramiko-1.15.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pycrypto ecdsa];
    src = fetchurl {
      url = "https://pypi.python.org/packages/04/2b/a22d2a560c1951abbbf95a0628e245945565f70dc082d9e784666887222c/paramiko-1.15.1.tar.gz";
      md5 = "48c274c3f9b1282932567b21f6acf3b5";
    };
    meta = {
      license = [ { fullName = "LGPL"; } { fullName = "GNU Library or Lesser General Public License (LGPL)"; } ];
    };
  };
  pep8 = super.buildPythonPackage {
    name = "pep8-1.5.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8b/de/259f5e735897ada1683489dd514b2a1c91aaa74e5e6b68f80acf128a6368/pep8-1.5.7.tar.gz";
      md5 = "f6adbdd69365ecca20513c709f9b7c93";
    };
    meta = {
      license = [ { fullName = "Expat license"; } pkgs.lib.licenses.mit ];
    };
  };
  psutil = super.buildPythonPackage {
    name = "psutil-2.2.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/df/47/ee54ef14dd40f8ce831a7581001a5096494dc99fe71586260ca6b531fe86/psutil-2.2.1.tar.gz";
      md5 = "1a2b58cd9e3a53528bb6148f0c4d5244";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  psycopg2 = super.buildPythonPackage {
    name = "psycopg2-2.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/86/fd/cc8315be63a41fe000cce20482a917e874cdc1151e62cb0141f5e55f711e/psycopg2-2.6.1.tar.gz";
      md5 = "842b44f8c95517ed5b792081a2370da1";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 { fullName = "GNU Library or Lesser General Public License (LGPL)"; } { fullName = "LGPL with exceptions or ZPL"; } ];
    };
  };
  py = super.buildPythonPackage {
    name = "py-1.4.29";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/2a/bc/a1a4a332ac10069b8e5e25136a35e08a03f01fd6ab03d819889d79a1fd65/py-1.4.29.tar.gz";
      md5 = "c28e0accba523a29b35a48bb703fb96c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  py-bcrypt = super.buildPythonPackage {
    name = "py-bcrypt-0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/68/b1/1c3068c5c4d2e35c48b38dcc865301ebfdf45f54507086ac65ced1fd3b3d/py-bcrypt-0.4.tar.gz";
      md5 = "dd8b367d6b716a2ea2e72392525f4e36";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  py-gfm = super.buildPythonPackage {
    name = "py-gfm-0.1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools Markdown];
    src = fetchurl {
      url = "https://pypi.python.org/packages/12/e4/6b3d8678da04f97d7490d8264d8de51c2dc9fb91209ccee9c515c95e14c5/py-gfm-0.1.3.tar.gz";
      md5 = "e588d9e69640a241b97e2c59c22527a6";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  pycrypto = super.buildPythonPackage {
    name = "pycrypto-2.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz";
      md5 = "55a61a054aa66812daf5161a0d5d7eda";
    };
    meta = {
      license = [ pkgs.lib.licenses.publicDomain ];
    };
  };
  pycurl = super.buildPythonPackage {
    name = "pycurl-7.19.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6c/48/13bad289ef6f4869b1d8fc11ae54de8cfb3cc4a2eb9f7419c506f763be46/pycurl-7.19.5.tar.gz";
      md5 = "47b4eac84118e2606658122104e62072";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit { fullName = "LGPL/MIT"; } { fullName = "GNU Library or Lesser General Public License (LGPL)"; } ];
    };
  };
  pyflakes = super.buildPythonPackage {
    name = "pyflakes-0.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/75/22/a90ec0252f4f87f3ffb6336504de71fe16a49d69c4538dae2f12b9360a38/pyflakes-0.8.1.tar.gz";
      md5 = "905fe91ad14b912807e8fdc2ac2e2c23";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pyparsing = super.buildPythonPackage {
    name = "pyparsing-1.5.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/2e/26/e8fb5b4256a5f5036be7ce115ef8db8d06bc537becfbdc46c6af008314ee/pyparsing-1.5.7.zip";
      md5 = "b86854857a368d6ccb4d5b6e76d0637f";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pyramid = super.buildPythonPackage {
    name = "pyramid-1.6.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools WebOb repoze.lru zope.interface zope.deprecation venusian translationstring PasteDeploy];
    src = fetchurl {
      url = "https://pypi.python.org/packages/30/b3/fcc4a2a4800cbf21989e00454b5828cf1f7fe35c63e0810b350e56d4c475/pyramid-1.6.1.tar.gz";
      md5 = "b18688ff3cc33efdbb098a35b45dd122";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pyramid-beaker = super.buildPythonPackage {
    name = "pyramid-beaker-0.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid Beaker];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d9/6e/b85426e00fd3d57f4545f74e1c3828552d8700f13ededeef9233f7bca8be/pyramid_beaker-0.8.tar.gz";
      md5 = "22f14be31b06549f80890e2c63a93834";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pyramid-debugtoolbar = super.buildPythonPackage {
    name = "pyramid-debugtoolbar-2.4.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid pyramid-mako repoze.lru Pygments];
    src = fetchurl {
      url = "https://pypi.python.org/packages/89/00/ed5426ee41ed747ba3ffd30e8230841a6878286ea67d480b1444d24f06a2/pyramid_debugtoolbar-2.4.2.tar.gz";
      md5 = "073ea67086cc4bd5decc3a000853642d";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } pkgs.lib.licenses.bsdOriginal ];
    };
  };
  pyramid-jinja2 = super.buildPythonPackage {
    name = "pyramid-jinja2-2.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid zope.deprecation Jinja2 MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a1/80/595e26ffab7deba7208676b6936b7e5a721875710f982e59899013cae1ed/pyramid_jinja2-2.5.tar.gz";
      md5 = "07cb6547204ac5e6f0b22a954ccee928";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pyramid-mako = super.buildPythonPackage {
    name = "pyramid-mako-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid Mako];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f1/92/7e69bcf09676d286a71cb3bbb887b16595b96f9ba7adbdc239ffdd4b1eb9/pyramid_mako-1.0.2.tar.gz";
      md5 = "ee25343a97eb76bd90abdc2a774eb48a";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pysqlite = super.buildPythonPackage {
    name = "pysqlite-2.6.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/5c/a6/1c429cd4c8069cf4bfbd0eb4d592b3f4042155a8202df83d7e9b93aa3dc2/pysqlite-2.6.3.tar.gz";
      md5 = "7ff1cedee74646b50117acff87aa1cfa";
    };
    meta = {
      license = [ { fullName = "zlib/libpng License"; } { fullName = "zlib/libpng license"; } ];
    };
  };
  pytest = super.buildPythonPackage {
    name = "pytest-2.8.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b1/3d/d7ea9b0c51e0cacded856e49859f0a13452747491e842c236bbab3714afe/pytest-2.8.5.zip";
      md5 = "8493b06f700862f1294298d6c1b715a9";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-catchlog = super.buildPythonPackage {
    name = "pytest-catchlog-1.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f2/2b/2faccdb1a978fab9dd0bf31cca9f6847fbe9184a0bdcc3011ac41dd44191/pytest-catchlog-1.2.2.zip";
      md5 = "09d890c54c7456c818102b7ff8c182c8";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-cov = super.buildPythonPackage {
    name = "pytest-cov-1.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py pytest coverage cov-core];
    src = fetchurl {
      url = "https://pypi.python.org/packages/11/4b/b04646e97f1721878eb21e9f779102d84dd044d324382263b1770a3e4838/pytest-cov-1.8.1.tar.gz";
      md5 = "76c778afa2494088270348be42d759fc";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-profiling = super.buildPythonPackage {
    name = "pytest-profiling-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six pytest gprof2dot];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d8/67/8ffab73406e22870e07fa4dc8dce1d7689b26dba8efd00161c9b6fc01ec0/pytest-profiling-1.0.1.tar.gz";
      md5 = "354404eb5b3fd4dc5eb7fffbb3d9b68b";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-runner = super.buildPythonPackage {
    name = "pytest-runner-2.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/99/6b/c4ff4418d3424d4475b7af60724fd4a5cdd91ed8e489dc9443281f0052bc/pytest-runner-2.7.1.tar.gz";
      md5 = "e56f0bc8d79a6bd91772b44ef4215c7e";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-timeout = super.buildPythonPackage {
    name = "pytest-timeout-0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/24/48/5f6bd4b8026a26e1dd427243d560a29a0f1b24a5c7cffca4bf049a7bb65b/pytest-timeout-0.4.tar.gz";
      md5 = "03b28aff69cbbfb959ed35ade5fde262";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit { fullName = "DFSG approved"; } ];
    };
  };
  python-dateutil = super.buildPythonPackage {
    name = "python-dateutil-1.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b4/7c/df59c89a753eb33c7c44e1dd42de0e9bc2ccdd5a4d576e0bfad97cc280cb/python-dateutil-1.5.tar.gz";
      md5 = "0dcb1de5e5cad69490a3b6ab63f0cfa5";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  python-editor = super.buildPythonPackage {
    name = "python-editor-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/2b/c0/df7b87d5cf016f82eab3b05cd35f53287c1178ad8c42bfb6fa61b89b22f6/python-editor-1.0.1.tar.gz";
      md5 = "e1fa63535b40e022fa4fd646fd8b511a";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  python-ldap = super.buildPythonPackage {
    name = "python-ldap-2.4.19";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/42/81/1b64838c82e64f14d4e246ff00b52e650a35c012551b891ada2b85d40737/python-ldap-2.4.19.tar.gz";
      md5 = "b941bf31d09739492aa19ef679e94ae3";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  python-memcached = super.buildPythonPackage {
    name = "python-memcached-1.57";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/52/9d/eebc0dcbc5c7c66840ad207dfc1baa376dadb74912484bff73819cce01e6/python-memcached-1.57.tar.gz";
      md5 = "de21f64b42b2d961f3d4ad7beb5468a1";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  python-pam = super.buildPythonPackage {
    name = "python-pam-1.8.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/de/8c/f8f5d38b4f26893af267ea0b39023d4951705ab0413a39e0cf7cf4900505/python-pam-1.8.2.tar.gz";
      md5 = "db71b6b999246fb05d78ecfbe166629d";
    };
    meta = {
      license = [ { fullName = "License :: OSI Approved :: MIT License"; } pkgs.lib.licenses.mit ];
    };
  };
  pytz = super.buildPythonPackage {
    name = "pytz-2015.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/7e/1a/f43b5c92df7b156822030fed151327ea096bcf417e45acc23bd1df43472f/pytz-2015.4.zip";
      md5 = "233f2a2b370d03f9b5911700cc9ebf3c";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pyzmq = super.buildPythonPackage {
    name = "pyzmq-14.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8a/3b/5463d5a9d712cd8bbdac335daece0d69f6a6792da4e3dd89956c0db4e4e6/pyzmq-14.6.0.tar.gz";
      md5 = "395b5de95a931afa5b14c9349a5b8024";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "LGPL+BSD"; } { fullName = "GNU Library or Lesser General Public License (LGPL)"; } ];
    };
  };
  recaptcha-client = super.buildPythonPackage {
    name = "recaptcha-client-1.0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0a/ea/5f2fbbfd894bdac1c68ef8d92019066cfcf9fbff5fe3d728d2b5c25c8db4/recaptcha-client-1.0.6.tar.gz";
      md5 = "74228180f7e1fb76c4d7089160b0d919";
    };
    meta = {
      license = [ { fullName = "MIT/X11"; } ];
    };
  };
  repoze.lru = super.buildPythonPackage {
    name = "repoze.lru-0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6e/1e/aa15cc90217e086dc8769872c8778b409812ff036bf021b15795638939e4/repoze.lru-0.6.tar.gz";
      md5 = "2c3b64b17a8e18b405f55d46173e14dd";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  requests = super.buildPythonPackage {
    name = "requests-2.9.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f9/6d/07c44fb1ebe04d069459a189e7dab9e4abfe9432adcd4477367c25332748/requests-2.9.1.tar.gz";
      md5 = "0b7f480d19012ec52bab78292efd976d";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  rhodecode-enterprise-ce = super.buildPythonPackage {
    name = "rhodecode-enterprise-ce-4.3.0";
    buildInputs = with self; [WebTest configobj cssselect flake8 lxml mock pytest pytest-cov pytest-runner];
    doCheck = true;
    propagatedBuildInputs = with self; [Babel Beaker FormEncode Mako Markdown MarkupSafe MySQL-python Paste PasteDeploy PasteScript Pygments Pylons Pyro4 Routes SQLAlchemy Tempita URLObject WebError WebHelpers WebHelpers2 WebOb WebTest Whoosh alembic amqplib anyjson appenlight-client authomatic backport-ipaddress celery colander decorator docutils gunicorn infrae.cache ipython iso8601 kombu msgpack-python packaging psycopg2 py-gfm pycrypto pycurl pyparsing pyramid pyramid-debugtoolbar pyramid-mako pyramid-beaker pysqlite python-dateutil python-ldap python-memcached python-pam recaptcha-client repoze.lru requests simplejson waitress zope.cachedescriptors dogpile.cache dogpile.core psutil py-bcrypt];
    src = ./.;
    meta = {
      license = [ { fullName = "AGPLv3, and Commercial License"; } ];
    };
  };
  rhodecode-tools = super.buildPythonPackage {
    name = "rhodecode-tools-0.8.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [click future six Mako MarkupSafe requests Whoosh elasticsearch elasticsearch-dsl];
    src = fetchurl {
      url = "https://code.rhodecode.com/rhodecode-tools-ce/archive/v0.8.3.zip";
      md5 = "9acdfd71b8ddf4056057065f37ab9ccb";
    };
    meta = {
      license = [ { fullName = "AGPLv3 and Proprietary"; } ];
    };
  };
  serpent = super.buildPythonPackage {
    name = "serpent-1.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3b/19/1e0e83b47c09edaef8398655088036e7e67386b5c48770218ebb339fbbd5/serpent-1.12.tar.gz";
      md5 = "05869ac7b062828b34f8f927f0457b65";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  setproctitle = super.buildPythonPackage {
    name = "setproctitle-1.1.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/33/c3/ad367a4f4f1ca90468863ae727ac62f6edb558fc09a003d344a02cfc6ea6/setproctitle-1.1.8.tar.gz";
      md5 = "728f4c8c6031bbe56083a48594027edd";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  setuptools = super.buildPythonPackage {
    name = "setuptools-20.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c4/19/c1bdc88b53da654df43770f941079dbab4e4788c2dcb5658fb86259894c7/setuptools-20.8.1.zip";
      md5 = "fe58a5cac0df20bb83942b252a4b0543";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  setuptools-scm = super.buildPythonPackage {
    name = "setuptools-scm-1.11.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/cd/5f/e3a038292358058d83d764a47d09114aa5a8003ed4529518f9e580f1a94f/setuptools_scm-1.11.0.tar.gz";
      md5 = "4c5c896ba52e134bbc3507bac6400087";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  simplejson = super.buildPythonPackage {
    name = "simplejson-3.7.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6d/89/7f13f099344eea9d6722779a1f165087cb559598107844b1ac5dbd831fb1/simplejson-3.7.2.tar.gz";
      md5 = "a5fc7d05d4cb38492285553def5d4b46";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit pkgs.lib.licenses.afl21 ];
    };
  };
  six = super.buildPythonPackage {
    name = "six-1.9.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/16/64/1dc5e5976b17466fd7d712e59cbe9fb1e18bec153109e5ba3ed6c9102f1a/six-1.9.0.tar.gz";
      md5 = "476881ef4012262dfc8adc645ee786c4";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  subprocess32 = super.buildPythonPackage {
    name = "subprocess32-3.2.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/28/8d/33ccbff51053f59ae6c357310cac0e79246bbed1d345ecc6188b176d72c3/subprocess32-3.2.6.tar.gz";
      md5 = "754c5ab9f533e764f931136974b618f1";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  supervisor = super.buildPythonPackage {
    name = "supervisor-3.3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [meld3];
    src = fetchurl {
      url = "https://pypi.python.org/packages/44/80/d28047d120bfcc8158b4e41127706731ee6a3419c661e0a858fb0e7c4b2d/supervisor-3.3.0.tar.gz";
      md5 = "46bac00378d1eddb616752b990c67416";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  transifex-client = super.buildPythonPackage {
    name = "transifex-client-0.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f3/4e/7b925192aee656fb3e04fa6381c8b3dc40198047c3b4a356f6cfd642c809/transifex-client-0.10.tar.gz";
      md5 = "5549538d84b8eede6b254cd81ae024fa";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl2 ];
    };
  };
  translationstring = super.buildPythonPackage {
    name = "translationstring-1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/5e/eb/bee578cc150b44c653b63f5ebe258b5d0d812ddac12497e5f80fcad5d0b4/translationstring-1.3.tar.gz";
      md5 = "a4b62e0f3c189c783a1685b3027f7c90";
    };
    meta = {
      license = [ { fullName = "BSD-like (http://repoze.org/license.html)"; } ];
    };
  };
  trollius = super.buildPythonPackage {
    name = "trollius-1.0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [futures];
    src = fetchurl {
      url = "https://pypi.python.org/packages/aa/e6/4141db437f55e6ee7a3fb69663239e3fde7841a811b4bef293145ad6c836/trollius-1.0.4.tar.gz";
      md5 = "3631a464d49d0cbfd30ab2918ef2b783";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  uWSGI = super.buildPythonPackage {
    name = "uWSGI-2.0.11.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9b/78/918db0cfab0546afa580c1e565209c49aaf1476bbfe491314eadbe47c556/uwsgi-2.0.11.2.tar.gz";
      md5 = "1f02dcbee7f6f61de4b1fd68350cf16f";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl2 ];
    };
  };
  urllib3 = super.buildPythonPackage {
    name = "urllib3-1.16";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3b/f0/e763169124e3f5db0926bc3dbfcd580a105f9ca44cf5d8e6c7a803c9f6b5/urllib3-1.16.tar.gz";
      md5 = "fcaab1c5385c57deeb7053d3d7d81d59";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  venusian = super.buildPythonPackage {
    name = "venusian-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/86/20/1948e0dfc4930ddde3da8c33612f6a5717c0b4bc28f591a5c5cf014dd390/venusian-1.0.tar.gz";
      md5 = "dccf2eafb7113759d60c86faf5538756";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  waitress = super.buildPythonPackage {
    name = "waitress-0.8.9";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ee/65/fc9dee74a909a1187ca51e4f15ad9c4d35476e4ab5813f73421505c48053/waitress-0.8.9.tar.gz";
      md5 = "da3f2e62b3676be5dd630703a68e2a04";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };
  wsgiref = super.buildPythonPackage {
    name = "wsgiref-0.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/41/9e/309259ce8dff8c596e8c26df86dbc4e848b9249fd36797fd60be456f03fc/wsgiref-0.1.2.zip";
      md5 = "29b146e6ebd0f9fb119fe321f7bcf6cb";
    };
    meta = {
      license = [ { fullName = "PSF or ZPL"; } ];
    };
  };
  zope.cachedescriptors = super.buildPythonPackage {
    name = "zope.cachedescriptors-4.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/40/33/694b6644c37f28553f4b9f20b3c3a20fb709a22574dff20b5bdffb09ecd5/zope.cachedescriptors-4.0.0.tar.gz";
      md5 = "8d308de8c936792c8e758058fcb7d0f0";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };
  zope.deprecation = super.buildPythonPackage {
    name = "zope.deprecation-4.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c1/d3/3919492d5e57d8dd01b36f30b34fc8404a30577392b1eb817c303499ad20/zope.deprecation-4.1.2.tar.gz";
      md5 = "e9a663ded58f4f9f7881beb56cae2782";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };
  zope.event = super.buildPythonPackage {
    name = "zope.event-4.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c1/29/91ba884d7d6d96691df592e9e9c2bfa57a47040ec1ff47eff18c85137152/zope.event-4.0.3.tar.gz";
      md5 = "9a3780916332b18b8b85f522bcc3e249";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };
  zope.interface = super.buildPythonPackage {
    name = "zope.interface-4.1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9d/81/2509ca3c6f59080123c1a8a97125eb48414022618cec0e64eb1313727bfe/zope.interface-4.1.3.tar.gz";
      md5 = "9ae3d24c0c7415deb249dd1a132f0f79";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpt21 ];
    };
  };

### Test requirements

  
}
