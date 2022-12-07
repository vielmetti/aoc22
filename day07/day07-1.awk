function isdir(arg)  { dirlist[length(dirlist)+1] = curdir arg  } 
function isfile(fn, size) { 
    # print curdir fn, size 
    filesize[curdir]+=size 
}


/^\$ cd \//         { curdir="/" }
/^\$ cd [a-zA-z]/   { curdir=curdir $3 "/" }
/^\$ cd \.\./       { 
                       split(curdir, a, /\//)
                       newdir="/"
                       for (i=2; i<=length(a)-2; i++)
                           newdir=newdir a[i] "/"
                       curdir=newdir
                    }
/^\$ ls/            { inls=1 }
inls=1 && /^dir/    { isdir($2)  }
inls=1 && /^[1-9]/   { isfile($2, $1) }
/^\$/               { inls=0 }

BEGIN { dirlist[1] = "/" }
{ }
END {
   for (dir in dirlist) { 
	   for (d in filesize) { 
                   print "dir", dirlist[dir], "d", d
		   if (index(d, dirlist[dir]) == 1) {
                      dirsize[dir] += filesize[d]
                   }
           }
   }
   for (dir in dirsize) {
       if (dirsize[dir] <= 100000)
           answer += dirsize[dir]
   }
   print answer
}
