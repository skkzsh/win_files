<#

.SYNOPSIS
Make Symbolic Link or Copy Carefully

.DESCRIPTION
This powershell script enables you to
make a symbolic link or copy a file
only if the source file exists and
you agree to remove the destination file.

.EXAMPLE
smartln.ps1 mklink source destination1
# Make Symbolic Link from Source to Destination

.EXAMPLE
smartln.ps1 copy source destination2
# Copy from Source to Destination

#>

## param([string]$cmd, [string]$src, [string]$dst)
## TODO: Parameters

### Name Arguments
$cmd, $src, $dst = $args

#### Exception Handling

try {
    ### à¯êîÇ™3å¬Ç≈Ç»ÇØÇÍÇŒError
    if ($args.Length -ne 3) {
        Write-Error 'No. of arguments must be 3.'
        throw New-Object ArgumentException
    }
    ## CommandÇ™óLå¯Ç≈Ç»ÇØÇÍÇŒError
    if ($cmd -ne 'mklink' -and $cmd -ne 'copy') {
        Write-Error "Invalid Option $cmd"
        throw New-Object ArgumentException
    }
    ## Linkå≥Ç™ë∂ç›ÇµÇ»ÇØÇÍÇŒError
    if (-not(Test-Path $src)) {
        Write-Error "Source $src not exists."
        throw New-Object Exception
    }
    ## MKLINKÇé¿çsÇ∑ÇÈÇ…Ç‡Ç©Ç©ÇÌÇÁÇ∏, ä«óùé“ì¡å†Ç™Ç»ÇØÇÍÇŒError
    #### TODO: Elevate Admin Privileges
    if ($cmd -eq 'mklink' -and `
            -not([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
                [Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Error "You don't have admin privileges."
        throw New-Object Exception
    }

}

catch [ArgumentException] {
    Get-Help $MyInvocation.MyCommand.Path -examples
    exit 1
}
catch [Exception] {
    exit 1
}


## NOTE: PowerShellÇ…Symbolic LinkÇÕÇ»Ç¢

## Request Confirmation
## Before Attempting to Remove $dst
## If $dst Exists
if (Test-Path $dst) {

    if (Test-Path $dst -PathType Container) {
        cmd /c "RD `"$dst`" && ECHO $dst Removed" # Take a Directory's Symbolic Link into account
        # rmdir -Confirm $dst
    }
    elseif (Test-Path $dst -PathType Leaf) {
        rm -Confirm $dst
    }
    else {
        Write-Error 'Remove Error'
        exit 1
    }
}

else {
    Write-Warning "Announce: Try to remove $dst, but not exists."
}


if (Test-Path $dst) {
    Write-Warning "Announce: $dst exists, so not make link."
}

## Symbolic Link
elseif ($cmd -eq 'mklink') {
    if (Test-Path $src -PathType Container) {
        cmd /c MKLINK /D $dst $src
    }
    elseif (Test-Path $src -PathType Leaf) {
        cmd /c MKLINK $dst $src
    }
    else {
        Write-Error 'MKLINK Error'
        exit 1
    }
}

## Copy
elseif ($cmd -eq 'copy') {
    if (Test-Path $src -PathType Container) {
        cp -Confirm $src $dst
    }
    elseif (Test-Path $src -PathType Leaf) {
        cp -Confirm $src $dst
    }
    else {
        Write-Error 'COPY Error'
        exit 1
    }
}

else {
    Write-Error "Invalid Option $cmd"
    Get-Help $MyInvocation.MyCommand.Path -examples
    exit 1
}

exit 0
