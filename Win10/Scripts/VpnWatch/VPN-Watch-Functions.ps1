
function PostOnTheScreen()
{
	cls
	write-host "`n`nTalk to Pooya before ending this process.`n`nThis script keeps our VPN alive.`n`nThanks." -ForegroundColor Magenta 
}

function TestVPN()
{
	$result = Test-Connection 172.16.0.3 -Count 2 -delay 1 -Quiet -ea silentlycontinue;
	return $result;
}

function LogStart()
{
	Add-Content VPN-Watch-Log.txt "__________________________________________________________"
	Add-Content VPN-Watch-Log.txt  ($(GetFormattedDateAndTime) + "Watch Started.")
}

function LogVpnDown()
{
	Add-Content VPN-Watch-Log.txt  ($(GetFormattedDateAndTime) + "VPN went Down!")
}

function PostVpnDown()
{
	write-host $(GetFormattedDateAndTime) "VPN went Down!"
}

function LogVpnDead()
{
	Add-Content VPN-Watch-Log.txt  ($(GetFormattedDateAndTime) + "VPN is Dead!")
}

function PostVpnDead()
{
	write-host $(GetFormattedDateAndTime) "VPN is Dead!"
}

function LogVpnUp()
{
	Add-Content VPN-Watch-Log.txt  ($(GetFormattedDateAndTime) + "VPN is Up again.")
}

function PostVpnUp()
{
	write-host $(GetFormattedDateAndTime) "VPN is Up again."
}

function GetFormattedDateAndTime()
{
	$(Get-Date -Format yyyy-MM-dd) + " @ " + $(Get-Date -Format HH:mm:ss) + " ----> "
}

function FunctionName()
{
	
}


#$scriptpath = $MyInvocation.MyCommand.Path
#$dir = Split-Path $scriptpath
#Write-host "My directory is $dir"

#taskkill /f /fi "Services eq RasMan"
#rasdial "GeeksNet" VPNadmin GkilG1452+

#echo "start"
#read-host "Press Enter"
#read-host "Press Enter"
#start-sleep 2

#Black
#Blue
#Cyan
#DarkBlue
#DarkCyan
#DarkGray
#DarkGreen
#DarkMagenta
#DarkRed
#DarkYellow
#Gray
#Green
#Magenta
#Red
#White
#Yellow
