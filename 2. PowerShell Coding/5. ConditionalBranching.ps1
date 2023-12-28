# Equality Operators.
# -gt greater than
# -igt greater than, case-insensitive
# -cgt greater than, case-sensitive
# -ge greater than or equal
# -ige greater than or equal, case-insensitive
# -cge greater than or equal, case-sensitive
# -lt less than
# -ilt less than, case-insensitive
# -clt less than, case-sensitive
# -le less than or equal
# -ile less than or equal, case-insensitive
# -cle less than or equal, case-sensitive

$set1 = @(1, 2, 3, 4)

if ($set1[0] -eq 1) {
    Write-Host "The sets of objects are identical."
} else {
    Write-Host "The sets of objects are different."
}

# If else statements
$Variable1 = 32
$Variable2 = 32
if ( $Variable1 -ne $Variable2  )
{
    Write-Output "The condition was true"
}

# elseif
$day = 3

if ( $day -eq 0 ) { $result = 'Sunday'        }
elseif ( $day -eq 1 ) { $result = 'Monday'    }
elseif ( $day -eq 2 ) { $result = 'Tuesday'   }
elseif ( $day -eq 3 ) { $result = 'Wednesday' }
elseif ( $day -eq 4 ) { $result = 'Thursday'  }
elseif ( $day -eq 5 ) { $result = 'Friday'    }
elseif ( $day -eq 6 ) { $result = 'Saturday'  }

$result

# depth sounder
$FINDVALUE = '$SDDPT,2.98,,*66'
if ( $FINDVALUE -like '$SD*')
{
    Write-Output "Found a depth sounder"
}

# Switch statement
$day = 4

switch ( $day )
{
    0 { $result = 'Sunday'    }
    1 { $result = 'Monday'    }
    2 { $result = 'Tuesday'   }
    3 { $result = 'Wednesday' }
    4 { $result = 'Thursday'  }
    5 { $result = 'Friday'    }
    6 { $result = 'Saturday'  }
}

$result





