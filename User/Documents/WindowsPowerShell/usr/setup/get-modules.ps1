<#
.SYNOPSIS
Get Modules and Codes
#>

# iex ((new-object net.webclient).DownloadString("http://bit.ly/psChocInstall"))

(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

Install-Module pscx
Install-Module Invoke-ElevatedCommand

# Install-Module PsUrl
# Install-Module Find-String
# Install-Module out-diff

# Install-Module posh-git
# Install-Module posh-npm

# wget --content-disposition -P ~/Downloads "https://github.com/downloads/tkellogg/Jump-Location/Jump.Location-?.?.?.zip"

# wget --content-disposition -P Code_Repos http://poshcode.org/get/696

# wget --content-disposition -P com http://powershell.com/cs/media/p/200/download.aspx
