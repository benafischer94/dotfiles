#Basic Powershell Setup
Set-ExecutionPolicy -Scope CurrentUser AllSigned

#Install Power VMWare Power CLI
Find-module -Name VMware.PowerCLI -y
#(Y) to install the NuGet module
Install-Module -Name VMware.PowerCLI -Scope CurrentUser -y
#(Y) to install from PSGallery
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCeip $true -InvalidCertificateAction Ignore -y
#(Y) To run the update