# f("mjqjpqmgbljsphdztnvjfqwrcgsmlb") = 19
# f("bvwbjplbgvbhsrlpgdmjqwftvncz") = 23
# f("nppdvjthqldpwncqszvftbrmjlhg") = 23

function startofmessage(packet) {
    split(packet, a, //)
    for (i in a) {
          testmsg = substr(packet, i, 14)
          r = isuniq(testmsg)
          if (r == 1)
              return(i + 14 - 1)
    }
}

function isuniq(string) {
    split(string, s, //)
    asort(s)
    for (j in s) {
       if (s[j] == s[j+1]) 
           return 0
    }
    return 1
}

BEGIN { print startofmessage("mjqjpqmgbljsphdztnvjfqwrcgsmlb") }

{ print startofmessage($0) }
