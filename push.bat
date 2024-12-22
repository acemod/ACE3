@echo off

git add .
git commit -m "[%username%] [%time%] [%date%]"

timeout /t 2 /nobreak

git push

timeout /t 2 /nobreak

git push

pause
cls
