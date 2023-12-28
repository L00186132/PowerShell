$NET = 111
$VAT = 0.23
$VATAMOUNT = $amount * $VAT
$GROSS = $NET + $VATAMOUNT
$text = "The total €$GROSS is the sum of the net value €$amount with the VAT amount €$VATAMOUNT at $VAT% VAT rate"
$text