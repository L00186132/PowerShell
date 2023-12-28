# Lists currently varialbes
Get-Variable 

# Assign variable values
$Rubbish = 1, 2, "a", "££"
$Rubbish
clear-variable -Name Rubbish
$Rubbish
Remove-Variable -Name Rubbish

# Clear variables after use = $null

$Rubbish = 1, 2, "a", "££"
$Rubbish.GetType()

# Cast variable, so it has a fixed type
[int]$Rubbish = 1
$Rubbish.GetType()
# pass a string, variable will automatically convert it.
$Rubbish = "123456789"
$Rubbish

$Rubbish = "This will give you an error!"
$Rubbish

# translate date into a datetime object, format assumed to be US, mmddyyyy. 
[datetime]$OGGI = "11/13/2022"
$OGGI

# input string in ddmmyyyy format.
$DateStr = '{0:dd/MM/yyyy}' -f $OGGI
$DateStr

# Alternative ways to creating variables.
New-Variable JORzVariable -value 3.142 -description "PI with write-protection" -option ReadOnly
Get-Variable JORzVariable