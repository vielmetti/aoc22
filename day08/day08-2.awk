function score(array) {
    s = 0
    for (i = 2; i<=length(array); i++) {
        s++
        if (array[i] >= array[1]) { break }
    }
    return s
}     

{ 
    split($0, a, //); 
    for (i in a) { trees[NR,i] = a[i] }
    width=length($0)
}

END { 
    height=NR
    maxscenic = 0
    for (tree in trees) {
        split(tree, separate, SUBSEP)
        x=separate[1]
        y=separate[2]
        print "x:", x, "y:", y, "value",  trees[tree]

        delete larray
        delete rarray
        delete uarray
        delete darray

        # edge case
        if ( (x==1) || (y==1) || (x==width) || (y==height) ) { # on the edge
           scenic[x,y] = 0
           continue # for tree in trees
        }
        # scenic on left
        larray[1] = trees[x,y]
        idx=1
        for (i=x-1; i>=1; i--) {
           idx++
           larray[idx]=trees[i,y]
           print "x:", x, "y:", y, "larray:", idx, "value", trees[i,y]
        }             
        # scenic on right
        rarray[1] = trees[x,y]
        idx=1
        for (i=x+1; i<=width; i++) {
           idx++
           rarray[idx]=trees[i,y]
        }
        # scenic on up
        uarray[1] = trees[x,y]
        idx=1
        for (j=y-1; j>=1; j--) {
           idx++
           uarray[idx]=trees[x,j]
        }
        # scenic on down
        darray[1] = trees[x,y]
        idx=1
        for (j=y+1; j<=height; j++) {
           idx++
           darray[idx]=trees[x,j]
        }

        scenic[x,y] = score(larray) * score(rarray) * score(uarray) * score(darray)
        print "x:", x, "y:", y, "scenic", scenic[x,y]
        print "x:", x, "y:", y, "u", score(uarray), "l", score(larray), "r", score(rarray), "d", score(darray)

        if (scenic[x,y] > maxscenic)
           maxscenic = scenic[x,y]
        
    }
    print maxscenic, "max scenic"
}
