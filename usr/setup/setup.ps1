<#
.SYNOPSIS
Make symbolic links or copy setting files
from repository.
#>

### Setting

## ���L���̐ݒ�Files��Dirctory
switch ($ENV:COMPUTERNAME) {
    default           { $prefix = "$ENV:USERPROFILE" }
}
$win_dir = "$prefix\Repository\bitbucket\win_files"
#$dropbox = "$prefix\Dropbox\setting"

## ���L���̊eDirectory�ŋ��L������Files��List
$home_files = '_nya'
## ���L���̊eDirectory�ŋ��L������Directores��List
$home_dirs = '_nya_d'

### Symbolic Link

## bin
# smartln.ps1 mklink "$win_dir\bin" "$Env:HOMEDRIVE\bin"

## home
# foreach ($file in $home_files + $home_dirs) {
foreach ($file in $home_files, $home_dirs) {
    smartln.ps1 mklink "$win_dir\home\$file" "$ENV:HOME\$file"
}

## Applications
smartln.ps1 copy "$win_dir\Applications\mayu\.mayu" "$ENV:HOMEDRIVE\Applications\yamy\.mayu"

## Documents
smartln.ps1 mklink "$win_dir\User\Documents\WindowsPowerShell" "$ENV:USERPROFILE\Documents\WindowsPowerShell"

## AppData

exit 0
