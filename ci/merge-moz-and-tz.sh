git checkout 2.0-merge
git merge origin/2.0-moz
git merge origin/2.0-TZ
git submodule init
git submodule update
cd modules/openlmis-web/
npm install
cd ../../
gradle clean setupdb setupExtensions seed build testseed --stacktrace