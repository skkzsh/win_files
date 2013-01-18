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

#if ($Env:TERM -eq 'dumb') {
#    $Env:TERM = 'ps1'
if (Test-Path C:\Applications\less-win32 -PathType Container) {
    $Env:PATH = "C:\Applications\less-win32\bin;" + $Env:Path
    $Env:PAGER = 'less'
}
# TODO: Console2ÇÃPager
#elseif (Test-Path $Env:ProgramFiles\Gow\bin -PathType Container)
#Set-Alias less "$Env:ProgramFiles\Gow\bin\less.exe"
#$Env:PATH += ";$Env:ProgramFiles\Gow\bin"
#}
#}

Set-Alias l less
$Env:VISUAL = 'gvim'
# $Env:EDITOR = 'gvim'

# grepÇ™ñ≥ÇØÇÍÇŒÅCgrepÇÃAliasÇçÏê¨
#if (-not(gcm grep -ea SilentlyContinue)) {
#    Set-Alias grep Select-String
#}

## Env
