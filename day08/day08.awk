{ split($0, a, //); for (i in a) { trees[NR,i] = a[i] } }

END { for (tree in trees) { print tree, trees[tree] } }
