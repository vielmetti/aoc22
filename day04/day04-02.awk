BEGIN { t=0 }
{ 
    split( $0, a, /,|\-/ ) 
    if ( ((a[1] <  a[3]) && (a[2] <  a[3])) || ((a[1] >  a[4]) && (a[2] >  a[4])) )
    {
#       print overlap $0
    } else {
        t+=1
    }
}
END { print t }
