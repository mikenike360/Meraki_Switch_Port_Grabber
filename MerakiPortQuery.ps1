if(Test-Path "C:\scripts\export_test.csv"){
        Remove-Item -Path "C:\scripts\export_test.csv"}

$apikey = Read-Host
$orgID = Read-Host

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "*/*")
$headers.Add("X-Cisco-Meraki-API-Key", $apikey)

$oresponse = Invoke-RestMethod "https://api.meraki.com/api/v0/organizations/$orgID/inventory" -Method 'GET' -Headers $headers -Body $body
$switches = $oresponse  | Where-Object {$_.Name -like '*SW*'} | Select-Object serial, Name

$export = "C:\scripts\export_test.csv"

$switches | ForEach-Object {

    try{

    $name = $_.Name
    $url = "https://api.meraki.com/api/v0/devices/$($_.serial)/switchPorts"
    $response = Invoke-RestMethod $url -Headers $headers -Body $body
    $response | Select-Object @{L='SwitchName';E={$name}},number, name, tags, type, vlan, accessPolicyNumber    | Export-Csv $export -Append -NoTypeInfo
    Write-Host "Added $name port settings to CSV File!" -ForegroundColor Green
    
    }

    catch{Write-host "Cannot connect to $name! Not adding to CSV" -ForegroundColor Red}

}
