#!/bin/sh
wget -O sonar.zip https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.6.1.2049/sonar-scanner-msbuild-4.6.1.2049-netcoreapp2.0.zip
unzip -qq sonar.zip -d tools/sonar
ls -l tools/sonar
chmod +x tools/sonar/sonar-scanner-3.3.0.1492/bin/sonar-scanner