#####################################################
#######                                       #######
####### Run this script with Admin privileges #######
#######                                       #######
#####################################################

.".\VPN-Watch-Functions.ps1"

PostOnTheScreen
LogStart

[bool] $VpnUp = 1

Do
{
	if(TestVPN -eq True)
	{
		if($VpnUp -eq 0)
		{
			$VpnUp = 1
			LogVpnUp
			#postVpnUp
		}
	}
	else
	{
		if($VpnUp)
		{
			$VpnUp = 0
			LogVpnDown
			#postVpnDown
			rasdial "PyVpn" PyUser PyPW | out-null
			start-sleep 10
		}
		else
		{
			LogVpnDead
			#postVpnDead
			taskkill /f /fi "Services eq RasMan" | out-null
			start-sleep 3
			rasdial "PyVpn" PyUser PyPW | out-null
			start-sleep 10
		}
	}
}
while("true")
