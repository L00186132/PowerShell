# For loop
# for (<Init>; <Condition>; <Repeat>)
# {
#     <Statement list>
# }

$counter=0 A 
for ($counter = 0; $counter -lt 10; $counter++)
{
    $counter
}

# ForEach
$MyArray = "J", "o", "h", "n"
foreach ($Letter in $MyArray)
{
    $Letter
}


# While Loop
while($val -ne 3)
{
    $val++
    Write-Host $val
}

# Switch Statement
while(($inp = Read-Host -Prompt "Select a command") -ne "Q"){
    switch($inp){
       L {"File will be deleted"}
       A {"File will be displayed"}
       R {"File will be write protected"}
       Q {"End"}
       default {"Invalid entry"}
       }
    }

# Do Until
$a = 0 
do
{
    “Starting Loop $a”
    $a
    $a++
    “Now `$a is $a”
} until ($a -ge 5)]
