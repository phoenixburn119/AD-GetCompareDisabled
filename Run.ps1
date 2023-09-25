$CVSSource = Import-Csv -Path "Z:\Kinzer_Directory\ADGetDisabledComputers\Source\UnsupportedOSmachines.csv"
[System.Collections.ArrayList]$DataCollector = @()
$CSVExport = ".\Export"

Function Get-ADEnabled {
    [CmdletBinding(DefaultParameterSetName='Hostname')]
    param(
        [parameter(Mandatory)]
        [string] $Number
    )


    $ValueCollector = [pscustomobject]@{'Hostname'=$($CVSSource.Hostname); 'OS Version'=$($CVSSource.OperatingSystem); 'AD Status'=$() }

    $DataCollector.add($ValueCollector)
}
Function Get-Hostname {
    [CmdletBinding(DefaultParameterSetName='CurrentHostname')]
    param(
        [parameter(Mandatory)]
        [string] $CurrentHostname
    )
    # Write-Host "$CurrentHostname"
    If($null -ne $CurrentHostname) {    
        If((($CurrentHostname).$CurrentHostname.length -8) -ne ".STO.COM") {
                $HostnameVal = ($CurrentHostname).Substring(0,$CurrentHostname.Length-8)
                Write-Output "$HostnameVAL"
            } else {
                # Write-Output "$CurrentHostname"
            }
    } else {
        
    }
}
# $temp = $("02-08-0913-589L.STO.COM").substring("02-08-0913-589L.STO.COM".length -8)

Get-Hostname -CurrentHostname "TAG1860.STO.COM"

for($idx = 0; $idx -lt 291; $idx++ ) {
    # Write-Host $CVSSource[$idx].Hostname

    If($null -ne $CVSSource[$idx].Hostname) {
        Get-Hostname -CurrentHostname $CVSSource[$idx].Hostname
    }   
}