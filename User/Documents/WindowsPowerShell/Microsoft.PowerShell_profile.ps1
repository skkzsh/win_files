## Path
# $Env:PATH += ""
# $Env:PATH = "" + $Env:Path

## Aliases
Set-Alias c Clear-Host
Set-Alias o Start-Process
Set-Alias p ping
Set-Alias nkfg 'nkf -g'
Set-Alias nkfu 'nkf --overwrite -w -Lu'
Set-Alias nkfe 'nkf --overwrite -e -Lu'
Set-Alias nkfs 'nkf --overwrite -s -Lw'
# Set-Alias wg wget
# Set-Alias c curl
Set-Alias vi vim
Set-Alias e runemacs
Set-Alias g git

## lessÇ»Ç«ÇÃëŒçÙ
if ($Env:TERM -eq 'dumb') {
    $Env:TERM = 'xterm'
}

if (Test-Path C:\Applications\less-win32 -PathType Container) {
    $Env:PATH = "C:\Applications\less-win32\bin;" + $Env:Path
    $Env:PAGER = 'less'
}
# elseif (Test-Path $Env:ProgramFiles\Gow\bin -PathType Container) {
#     $Env:PATH = "$Env:ProgramFiles\Gow\bin;" + $Env:PATH
#     # GowÇÊÇËPriorityÇè„Ç∞ÇÈ
#     $Env:PATH = "$Env:ProgramFiles\PuTTY;" + $Env:PATH
#     $Env:PATH = "$Env:HOMEDRIVE\Applications\vim73-kaoriya-win64;" + $Env:PATH
#     # Set-Alias less "$Env:ProgramFiles\Gow\bin\less.exe"
#     $Env:PAGER = 'less'
# }
# }
# TODO: Console2ÇÃPager

Set-Alias l less

# grepÇ™ñ≥ÇØÇÍÇŒÅCgrepÇÃAliasÇçÏê¨
#if (-not(gcm grep -ea SilentlyContinue)) {
#    Set-Alias grep Select-String
#}

## Env
$Env:VISUAL = 'gvim'
# $Env:EDITOR = 'gvim'

## Functions
## TODO: Verb - Noun

function gtop {
    cd $(git rev-parse --show-toplevel)
}

## TODO: Exception Handling
function take ($dir) {
    md $dir
    cd $dir
}

Set-Alias gpga 'gpg -c --cipher-algo=aes256'
Set-Alias osa 'openssl aes-256-cbc'

## Plugins

if (Test-Path "$Env:USERPROFILE\Documents\WindowsPowerShell\Modules\PsGet" -PathType Container) {
    Import-Module PsGet
}

# Load Jump-Location profile
if (Test-Path "$Env:USERPROFILE\Documents\WindowsPowerShell\plugins\Jump.Location" -PathType Container) {
    . "$Env:USERPROFILE\Documents\WindowsPowerShell\plugins\Jump.Location\Load.ps1"
}

# Load posh-git example profile
#if (Test-Path "$Env:USERPROFILE\Documents\WindowsPowerShell\Modules\posh-git" -PathType Container) {
#    . "$Env:USERPROFILE\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1"
#}
