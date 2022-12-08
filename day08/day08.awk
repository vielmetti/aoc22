{ 
    split($0, a, //); 
    for (i in a) { trees[NR,i] = a[i] }
    width=length($0)
}

END { 
    height=NR
    for (tree in trees) {
        split(tree, separate, SUBSEP)
        x=separate[1]
        y=separate[2]
        print "x:", x, "y:", y, "value",  trees[tree]

        leftblock = 0
        rightblock = 0
        topblock = 0
        bottomblock = 0

        # edge case
        if ( (x==1) || (y==1) || (x==width) || (y==height) ) { # on the edge
           print x, y, "seen on edge"
           seen++
           continue # for tree in trees
        }
        # blocked on left
        for (i=1; i<x; i++) {
           if (trees[i,y] >= trees[x,y]) {
              leftblock = 1
              print "tree", x, y, "blocked on left"
           }
        }             
        # blocked on right
        for (i=x+1; i<=width; i++) {
           if (trees[i,y] >= trees[x,y]) {
              rightblock = 1
              print "tree", x, y, "blocked on right"
           }
        }
        # blocked on top
        for (j=1; j<y; j++) {
           if (trees[x,j] >= trees[x,y]) {
              topblock = 1
              print "tree", x, y, "blocked on top"
           }
        }
        # blocked on bottom
        for (j=y+1; j<=height; j++) {
           if (trees[x,j] >= trees[x,y]) {
              bottomblock = 1
              print "tree", x, y, "blocked on bottom"
           }
        }

        if ((leftblock + rightblock + topblock + bottomblock) != 4) {
           print "x:", x, "y:", y, "value", trees[x,y], "seen in middle"
           seen++
        }
    }
    print seen, "trees seen"
}
