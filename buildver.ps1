param (
    [string]$buildVersion = "1.0.0.0",
    [string]$buildNumber = "0.0.5.541.0.0"
)

function Normalize-Version {
    param (
        [string]$version,
        [int]$length = 4,
        [bool]$padFront = $false
    )
    
    $parts = $version -split '\.'
    if ($padFront) {
        while ($parts.Length -lt $length) {
            $parts = @('0') + $parts
        }
    } else {
        while ($parts.Length -lt $length) {
            $parts += '0'
        }
    }
    return $parts[0..($length-1)]
}

function Sum-Versions {
    param (
        [string]$buildVersion,
        [string]$buildNumber
    )
    
    $buildVersionParts = Normalize-Version -version $buildVersion
    $buildNumberParts = Normalize-Version -version $buildNumber -padFront $true
    
    $resultParts = @()
    for ($i = 0; $i -lt $buildVersionParts.Length; $i++) {
        $resultParts += [string]([int]$buildVersionParts[$i] + [int]$buildNumberParts[$i])
    }
    
    return ($resultParts -join '.')
}

$envfullbuildVersion = Sum-Versions -buildVersion $buildVersion -buildNumber $buildNumber
Write-Output $envfullbuildVersion  # Expected Output: 1.0.5.541