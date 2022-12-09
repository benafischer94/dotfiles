#!/bin/bash
# Adds support for SonarQube's SonarScanner
echo "Downloading and install SonarQube SonarScanner"
mkdir /tmp/sonar > /dev/null
pushd /tmp/sonar > /dev/null
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip -O ./sonar-scanner-cli.zip >/dev/null
unzip sonar-scanner-cli.zip > /dev/null
rm sonar-scanner-cli.zip > /dev/null
sudo mv ./sonar* /usr/local/bin/sonar-scanner > /dev/null
popd > /dev/null
rm -rf /tmp/sonar
exit 0