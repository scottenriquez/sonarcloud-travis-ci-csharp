#!/bin/sh
echo "Changing to /src directory..."
cd src
echo "Executing MSBuild.exe begin command..."
mono ../tools/sonar/SonarScanner.MSBuild.exe begin /o:"scottenriquez-github" /k:"scottenriquez_sonarcloud-travis-ci-csharp" /d:sonar.organization="scottenriquez-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login=${SONAR_TOKEN}
echo "Running build..."
dotnet build
echo "Running tests..."
dotnet test SonarCloud.Travis.Integration.Tests/SonarCloud.Travis.Integration.Tests.csproj
echo "Executing MSBuild.exe end command..."
mono ../tools/sonar/SonarScanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}