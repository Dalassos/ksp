cd C:\GOG Games\Kerbal Space Program\Ships\Script
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)


echo "# ksp" >> README.md
rem git init
rem git add README.md
git add --all
git commit -m "%mydate%_%mytime%"
git branch -M main
git remote add origin https://github.com/Dalassos/ksp.git
git push -u origin main
pause