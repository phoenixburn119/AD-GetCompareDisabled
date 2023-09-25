$CSVSource = Import-Csv -Path "PATH TO CSV FILE"
# CSV Columns must be "Hostname" and OperatingSystem otherwies the script won't read the text.
# There can be more columns but it only reads those two columns.
[System.Collections.ArrayList]$DataCollector = @()

Function Get-ADEnabled {
    [CmdletBinding(DefaultParameterSetName='Hostname')]
    param(
        [parameter(Mandatory)]
        [string] $Hostname
    )
    Try{
        $ADReturn = Get-ADComputer -Identity (Get-Hostname -CurrentHostname $Hostname)
    } Catch{
        $ADReturn = "Cannot find object"
    }
    
    $ValueCollector = [pscustomobject]@{'Hostname'=$($CSVSource[$idx].Hostname); 'OS Version'=$($CSVSource[$idx].OperatingSystem); 'AD Status'=$(If($null -ne $ADReturn.Enabled){Write-Output $ADReturn.Enabled}Else{"Could not find object."})}
    Write-Host $ValueCollector
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

            }
    } else {
        
    }
}

for($idx = 0; $idx -lt 291; $idx++ ) {
    If($null -ne $CSVSource[$idx].Hostname) {
        # Get-Hostname -CurrentHostname $CSVSource[$idx].Hostname
        Get-ADEnabled -Hostname $CSVSource[$idx].Hostname
    }   
}
$DataCollector | export-csv -Path .\Export\Export.csv