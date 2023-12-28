# added some modules automatically when I used Get-Help
Get-Help -Name C:\PowerShell\Install-PowerShell.ps1

# output is three separate paths
echo $env:PSModulePath

# Recce the net
Get-NetIPAddress