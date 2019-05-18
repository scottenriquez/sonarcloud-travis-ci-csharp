#!/bin/sh
echo "Starting install..."
wget -O sonar.zip https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.0.2.892/sonar-scanner-msbuild-4.0.2.892.zip
echo "Unzipping..."
unzip -qq sonar.zip -d tools/sonar
echo "Displaying file structure..."
find .
ls -l tools/sonar
echo "Changing permissions..."
chmod +x tools/sonar/sonar-scanner-3.0.3.778/bin/sonar-scanner