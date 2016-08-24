:: create temp workspace
rd /s/q E:\project_release\temp
mkdir E:\project_release\temp
mkdir E:\project_release\temp\warehouse

:: copy generated file into temp workspace
copy README.md E:\project_release\temp\readme.txt /y
copy ewandian-b2b2c-erp-wh-webapp\target\ewandian-b2b2c-erp-wh-webapp-1.0.0.war E:\project_release\temp\warehouse.war /y
xcopy /s/e/v/y ewandian-b2b2c-erp-wh-webapp\target\ewandian-b2b2c-erp-wh-webapp-1.0.0\WEB-INF\resources\warehouse E:\project_release\temp\warehouse

:: upload warehouse rctest war
cd /d E:\project_release\warehouse\uat
git config --global user.email "huade@1wandian.com"
git config --global user.name "suhuade"
git pull -f http://suhuade:su_huade112@192.168.1.158/ewandian/warehouse.git release
copy E:\project_release\temp\readme.txt E:\project_release\warehouse\uat\readme.txt /y
copy E:\project_release\temp\warehouse.war E:\project_release\warehouse\uat\warehouse.war /y
git add --all
git commit -m "auto commit and push for releasing rctest version"
git push -f http://suhuade:su_huade112@192.168.1.158/ewandian/warehouse.git release

:: upload warehouse rctest js
cd /d E:\project_release\zhpt-front\latest\WEB-INF\resources\warehouse
git reset --hard origin/release
git fetch http://suhuade:su_huade112@192.168.1.158/ewandian/zhpt-front.git release
del /s/q E:\project_release\zhpt-front\latest\WEB-INF\resources\warehouse\*
xcopy /s/e/v/y E:\project_release\temp\warehouse E:\project_release\zhpt-front\latest\WEB-INF\resources\warehouse
git add --all
git commit -m "auto commit and push for releasing rctest version"
git push -f http://suhuade:su_huade112@192.168.1.158/ewandian/zhpt-front.git release