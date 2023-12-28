##################################################
# Create the domain controllers
##################################################
Install-WindowsFeature -name AD-Domain-Services –IncludeManagementTools

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "ads.kmn.ie" `
-DomainNetbiosName "ads" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

Shutdown /r /t 0


##################################################
# configure the domain controller 1
##################################################
$SERVERNAME = "dc1"
$FOREST = "ads.kmn.ie"
$DNSNAME = $SERVERNAME + "." + $FOREST

# Set the IP address for the DC
Rename-Computer -NewName $SERVERNAME
Get-NetIPAddress
New-NetIPAddress -InterfaceIndex 16 -IPAddress 172.27.6.11 -PrefixLength 24 -DefaultGateway 172.27.6.20
Restart-Computer

# Configure AD, DNS
Install-ADDSForest -DomainName $FOREST
Install-WindowsFeature DHCP -IncludeManagementTools

# Configure DHCP, add a single scope
Add-DhcpServerInDC -DnsName $DNSNAME -IPAddress 172.27.6.11
Add-DhcpServerv4Scope -Name InfraServers -StartRange 172.27.6.150 -EndRange 172.27.6.199 -SubnetMask 255.255.255.0

# Set time to sync'h with a local NTP server.
w32tm /config /manualpeerlist:172.27.15.254 /syncfromflags:manual /update


##################################################
# configure the domain controller 2
##################################################
$SERVERNAME = "dc2"
$FOREST = "ads.kmn.ie"
$DNSNAME = $SERVERNAME + "." + $FOREST

# Set the IP address for the DC
Rename-Computer -NewName $SERVERNAME
Get-NetIPAddress
New-NetIPAddress -InterfaceIndex 9 -IPAddress 172.27.6.12 -PrefixLength 24 -DefaultGateway 172.27.6.20
Set-DnsClientServerAddress -InterfaceIndex 9 -ServerAddresses 172.27.6.11
Restart-Computer

# Join the existing Domain
Add-Computer -DomainName $FOREST -Restart

# Install software
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Add this as a second DC
Install-ADDSDomainController -DomainName $FOREST -InstallDns:$true -Credential (Get-Credential "janus\administrator")

# Configure DHCP
Install-WindowsFeature DHCP -IncludeManagementTools
Add-DhcpServerInDC -DnsName $DNSNAME -IPAddress 172.27.6.12



##################################################
# I verify each DNS using Resolve-Dnsname
##################################################
Resolve-DnsName -Name dc-1 -Server 172.28.78.1 -Type A

Resolve-DnsName -Name server-1 -Server 172.28.78.1 -Type A