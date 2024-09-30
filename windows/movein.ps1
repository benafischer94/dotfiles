#Basic Powershell Setup
Set-ExecutionPolicy -Scope CurrentUser AllSigned

#Install GIT
winget install --id Git.Git -e --source winget
#Install Power VMWare Power CLI
Find-module -Name VMware.PowerCLI -y
#(Y) to install the NuGet module
Install-Module -Name VMware.PowerCLI -Scope CurrentUser -y
#(Y) to install from PSGallery
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCeip $true -InvalidCertificateAction Ignore -y
# Sharepoint Online management
#(Y) To run the update
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Scope CurrentUser
#(Y) To install

#ToDo a bool for checking whether to install RSAT Tools.
$rsat = Read-Host -Prompt "Select from 0,1,or 2 for the following:
0: No RSAT tools
1: Just DHCP and DNS manager
2: All RSAT tools"

if ($rsat -eq '0') {
} elseif ($rsat -eq '1') {
    Add-WindowsCapability -Online -Name Rsat.DHCP.Tools
    Add-WindowsCapability -Online -Name Rsat.Dns.Tools
} elseif ($rsat -eq '2') {
    Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
} else {
    Write-Output "Invalid choice."
}

# Create and copy ssh .config if not existing
[System.IO.Directory]::CreateDirectory("~\.ssh")
mv ..\shared\.ssh\config ~\.ssh\config
