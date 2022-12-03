# write a function such that f("vJrwpWtwJgWrhcsFMMfFFhFp","jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL","PmmdzqPrVvPwwTWBwg") returns "r".
function istriple(r1,r2,r3)
{
    split(r1, a, //)
    for (i in a) {
	if (index(r2, a[i]) != 0 && index(r3, a[i]) != 0 ) {
            return a[i]
        }
    }
	
}

function priority(item)
{
    return index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", item)
}

# { print isdup("vJrwpWtwJgWrhcsFMMfFFhFp") }

BEGIN { t = 0 }
{
    l1 = $0
    if (getline <= 0) {
         print("unexpected EOF or error l2:", ERRNO) > "/dev/stderr"
         exit
    }
    l2 = $0
    if (getline <= 0) {
         print("unexpected EOF or error l3:", ERRNO) > "/dev/stderr"
         exit
    }
    l3 = $0
    t += priority(istriple(l1,l2,l3))
}
END { print t }
