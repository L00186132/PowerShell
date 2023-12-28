# String functions available,
$StringValue = "Yoo hoo!"
$StringValue.ToUpper()
$StringValue.ToLower()

# Arrays
$MyArray = 1,2,3,4,5
$MyArray[1]

# int (32-bit) vs long (64-bit) numbers
$LittleNumber = 12345
$LittleNumber.GetType()
$BigNumber = 123456789123456789
$BigNumber.GetType()

# floating point
[float]$Floaty32 = 12.12
$Floaty32.GetType()
[double]$Floaty64 = 12345.1234
$Floaty64.GetType()