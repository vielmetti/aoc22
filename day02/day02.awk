BEGIN { t = 0 }
/^A X$/ { t+=(1+3) }
/^A Y$/ { t+=(2+6) }
/^A Z$/ { t+=(3+0) }
/^B X$/ { t+=(1+0) }
/^B Y$/ { t+=(2+3) }
/^B Z$/ { t+=(3+6) }
/^C X$/ { t+=(1+6) }
/^C Y$/ { t+=(2+0) }
/^C Z$/ { t+=(3+3) }
END { print t }
