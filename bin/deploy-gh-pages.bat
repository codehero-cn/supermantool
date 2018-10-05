::this bat is used to deploy project on github.com gh-pages
::on the root dictory,cmd:.\bin\deploy-gh.pages.bat
::authoer eleven

rem ###################  git gh-pages   ###################
if exist .\.git\index.lock (del .git\index.lock) else (echo index.lock is not exist)
if exist .\.git\.COMMIT_EDITMSG.swp (del .git\.COMMIT_EDITMSG.swp) else (echo COMMIT_EDITMSG.swp is not exist)
git add ./gh-pages/
git commit ./gh-pages/ --amend  -m "deploy-gh-pages"
git subtree push --prefix=gh-pages/ github_supertool gh-pages --squash
rem ######  success!!!now you can browser the website ######
