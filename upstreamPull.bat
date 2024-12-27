@echo off

git rebase --continue
git rebase -i master origin/updates

pause