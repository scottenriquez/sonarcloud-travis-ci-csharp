# Example SonarCloud/SonarScanner C# Integration for Travis CI
SonarQube is a very powerful source code continuous inspection tool. It's incredibly valuable to have integrated into a project's CI/CD pipeline to help maintain code quality and prevent issues. In the process of adding this to some existing open source C# projects, I discovered that there's not quality, up-to-date documentation on integrating C# inspection with Travis CI. This project serves as a functioning example.

# Getting Started
Note that you'll need a SonarCloud account created, a project set up, and a token for the project.

# Travis CI Setup
You can either use an existing GitHub repository or create a new one. You'll need to enable Travis CI for the repository and create a secure environment variable named `SONAR_TOKEN` initialized as your SonarCloud token. Make sure that you don't commit the token in your source code or expose it via logs.

# Which Release of This Project to Use
You'll notice that there are three releases of this example project. The first two require Mono as a dependency because they utilize .NET Framework builds of the SonarScanner for MSBuild tool. The third option only uses .NET Core. It's worth noting that the Travis CI builds with Mono and .NET Core take on average ten minutes to complete whereas the .NET Core only builds take roughly two minutes.

## 0.0.1: SonarScanner for MSBuild 4.0.2.892
- .NET Core: 2.1.502
- Mono: latest
- Notes: This version uses an old version of SonarScanner. This release is not recommend for any use.

## 0.0.2: SonarScanner for MSBuild version 4.6.1.2049 (.NET Framework 4.6)
- .NET Core: 2.1.502
- Mono: latest
- Notes: This version only uses .NET Core because my unit tests in the sample class library target it. If your project only uses .NET Framework, you can drop the .NET Core dependency from the Travis CI YAML file. This release is recommended for C# projects targeting .NET Framework.

## 1.0.0: SonarScanner for MSBuild version 4.6.1.2049 (.NET Core)
- .NET Core: 2.1.502
- Mono: none
- Notes: This version assumes no targets of .NET Framework and does not install Mono. This version is recommended for pure .NET Core projects. It's also the most performant.

# Updating Your Project
## Updating the Travis CI YAML File
Start by including the [SonarCloud addon](https://docs.travis-ci.com/user/sonarcloud/) and pasting in your SonarCloud organization name.
```
addons:
  sonarcloud:
    organization: "YOUR_ORG_NAME_HERE"
```
You'll also need to run the ```/tools/travis-ci-install-sonar.sh``` script as part of ```before-install``` section and ```/tools/travis-ci-build.sh``` as part of the ```script``` section.

## Modifying ```travis-ci-build.sh```
You'll need to make a few replacements in this file. Add your organization name and project key to the ```SonarScanner.MSBuild.dll``` (or ```SonarScanner.MSBuild.exe``` for the .NET Framework version) arguments. Note that you can also expose these as environment variables like ```SONAR_TOKEN```. You'll also want to add any project specific build and test commands to this script.
```
dotnet ../tools/sonar/SonarScanner.MSBuild.dll begin /o:"YOUR_ORG_NAME_HERE" /k:"YOUR_PROJECT_KEY_HERE" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.verbose=true /d:sonar.login=${SONAR_TOKEN}
# Add additional build and test commands here
dotnet build
dotnet test
dotnet ../tools/sonar/SonarScanner.MSBuild.dll end /d:sonar.login=${SONAR_TOKEN}
```

# Testing
Your Travis CI build will fail if there are any issues with the SonarScanner command. If the build passes, you can view the feedback via the SonarCloud dashboard.

# References
I was able to find [a project called NGenerics](https://github.com/ngenerics/ngenerics) that utilizes an older version of SonarScanner with some syntax differences. There was also [a short blog post by Riaan Hanekom](https://riaanhanekom.com/2018/01/21/using-sonar-cloud-on-net-core-with-travis) that expands on it. These were extremely helpful starting points.

# Travis CI Build Status
[![Build Status](https://travis-ci.org/scottenriquez/sonarcloud-travis-ci-csharp.svg?branch=master)](https://travis-ci.org/scottenriquez/sonarcloud-travis-ci-csharp)