git submodule init
git submodule update
cd modules/openlmis-web/
npm install
cd ../../
gradle clean setupdb setupExtensions seed build testseed --stacktrace