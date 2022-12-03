# write a function such that f(vJrwpWtwJgWrhcsFMMfFFhFp) returns "p".
function isdup(rucksack)
{
    l = length(rucksack)/2
    front = substr(rucksack,1,l)
    back = substr(rucksack,1+l,l)

    split(front, a, //)
    for (i in a) {
	if (index(back, a[i]) != 0) {
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
{ t += priority(isdup($1)) }
END { print t }
