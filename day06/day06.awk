# f("mjqjpqmgbljsphdztnvjfqwrcgsmlb") = 7
# f("bvwbjplbgvbhsrlpgdmjqwftvncz") = 5
# f("nppdvjthqldpwncqszvftbrmjlhg") = 6

function startofpacket(packet) {
    split(packet, a, //)
    for (i in a) {
        if ( (a[i]!=a[i+1]) && (a[i]!=a[i+2]) && (a[i]!=a[i+3]) && (a[i+1]!=a[i+2]) && (a[i+1]!=a[i+3]) && (a[i+2]!=a[i+3] ) ) {
            marker = i+3
            return marker
       }
    }
}

{ print startofpacket($0) }
