$u = "Administrator"
$p = "Pa$$w0rd"
Enter-PSSession -ComputerName "192.168.1.36" -Credential $credentials -ErrorAction SilentlyContinue
$Zones = @(Get-DnsServerResourceRecord -ZoneName "example.com") 
$calc = $Zones.Count
$exist = "NO"
$hostname = Read-Host "Enter hostname: "
function AddDNS{
Add-DnsServerResourceRecordA -ZoneName "example.com" -Name $hostname -IPv4Address "172.16.10.10"

}
foreach ($Zone in $Zones){
if($Zone.HostName -eq "$hostname")
{
$exist = "YES"

}
}
Write-Host "DNS record exist:" $exist
if($postoji -ieq "DA") {break}
$addDNS = Read-Host "Add $hostname as new DNS record (YES/NO): "
if($addDNS -eq "YES"){
AddDNS
Write-Host "Successfully added"
}

#Get-DnsServerResourceRecord -ZoneName "mirza.local"