function movestack(n, src, dst) {
#    print "move" n "from" a[src] "to" a[dst]
    a[dst] = a[dst] substr(a[src], length(a[src])-n+1, n)
    a[src] = substr(a[src], 1, length(a[src]) - n)
#    print "new" "src" a[src] "dst" a[dst]
}

BEGIN { header=1 }

header==1 && $1 != 1 {
    slot = 0
    for (pos = 2; pos < length($0); pos += 4) {
        slot++
        a[slot] = substr($0, pos, 1) a[slot]
    }
}

/^ 1/ { 
    header=0
    piles=$NF 
    print "piles:" piles
    for (i = 1; i <= piles; i++)
        {
        print i, a[i]
        gsub(" ","",a[i])
	print i, a[i]
        }
}

/^move/ && header==0 { 
    movestack($2, $4, $6)
    for (i=1; i<=piles; i++)
        {
        print "pile" i "is" a[i]
        }
}

END {
   for (j = 1; j <= piles; j++) {
       printf("%s",substr(a[j], length(a[j]), 1))
   }
   print "\n"
}


