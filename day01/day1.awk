BEGIN { t = 0 }
$1 ~ /[0-9]+/ { t+=$1 }
/^$/ { print t; t=0 }
END { print t }
