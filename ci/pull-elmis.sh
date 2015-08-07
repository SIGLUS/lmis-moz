git status
git checkout -B 2.0-TZ
git status

git submodule init
git submodule update
cd modules/openlmis-web
npm install
cd ../..
gradle clean setupdb setupExtensions seed test

git remote -v
git remote set-url origin git@github.com:OpenLMIS/open-lmis.git
git remote -v
git push origin 2.0-TZ
git status