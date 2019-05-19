#!/bin/sh
echo "Changing to /src directory..."
cd src
echo "Executing MSBuild DLL begin command..."
dotnet ../tools/sonar/SonarScanner.MSBuild.dll begin /o:"scottenriquez-github" /k:"scottenriquez_sonarcloud-travis-ci-csharp" /d:sonar.organization="scottenriquez-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login=${SONAR_TOKEN}
echo "Running build..."
dotnet build SonarCloud.Travis.Integration.sln
echo "Running tests..."
dotnet test SonarCloud.Travis.Integration.Tests/SonarCloud.Travis.Integration.Tests.csproj
echo "Executing MSBuild.exe end command..."
dotnet ../tools/sonar/SonarScanner.MSBuild.dll end /d:sonar.login=${SONAR_TOKEN}