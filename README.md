# Meraki_Switch_Port_Grabber
A PowerShell Program that grabs all Meraki switch ports settings in a given organization

Before Running do this!

1. Make sure you have your Meraki API key on hand. You can hard code the key if you paste into the $apikey variable instead of using Read-Host or just use Read-Host and paste the key in the terminal when prompted

2. Do the same for your organization ID. You can hard code that as well or just use the Read-Host

3. You will need to download and dot source Convert-OutputForCsv to same directory that your are running the script from. You can download the script here: https://gallery.technet.microsoft.com/scriptcenter/Convert-OutoutForCSV-6e552fc6
