cd C:\GOG Games\Kerbal Space Program\Ships\Script

echo "# ksp commit %DATE%_%TIME%" >> README.md
rem git init
rem git add README.md
git add --all
git commit -m "%mydate%_%mytime%"
git branch -M main
git remote add origin https://github.com/Dalassos/ksp.git
git push -u origin main
pause