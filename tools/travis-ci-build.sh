#!/bin/sh
cd src
mono ../tools/sonar/SonarQube.Scanner.MSBuild.exe begin /k:"scottenriquez_sonarcloud-travis-ci-csharp" /d:sonar.organization="scottenriquez-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login=${SONAR_TOKEN}
dotnet build
dotnet test SonarCloud.Travis.Integration.Tests/SonarCloud.Travis.Integration.Tests.csproj
mono ../tools/sonar/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}