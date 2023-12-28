$MyModulePath = "C:\PowerShell\2. PowerShell Coding\Modules\HelloWorld"

$MyModule = @"
# HelloWorld.PSM1
Function Get-HelloWorld {
 "Hello World from JOR"
}
"@

New-Item -Path $MyModulePath -ItemType Directory -Force | Out-Null
$MyModule | Out-File -FilePath $MyModulePath\HelloWorld.PSM1
Get-Module -Name HelloWorld -ListAvailable