input:read0 `:inputs/day05.txt
parsed:value each/: " -> " vs/: input


d5p1:{[parsed]
    genbetween:{
        if[(x[0;0]<>x[1;0]) and x[0;1]<>x[1;1];
            :enlist (10000 10000);
            ];
        add:signum[neg s]*til each 1+ abs s:(-). x;
        flip x[0] +'@[add;first where  add~\:enlist 0;:;(max count each add)#0]
        }


    coords:genbetween each parsed;
    (sum 1<count each group raze coords)-1
    }

d5p2:{[parsed]
    genbetween:{
        if[(x[0;0]<>x[1;0]) and x[0;1]<>x[1;1];
            :flip(x[0;0]-signum[sn]*til 1+abs sn:x[0;0]-x[1;0];
                x[0;1]-signum[s]*til 1+abs s:x[0;1]-x[1;1]
                )
            ];
        add:signum[neg s]*til each 1+ abs s:(-). x;
        flip x[0] +'@[add;first where  add~\:enlist 0;:;(max count each add)#0]
        }

    coords:genbetween each parsed;
    sum 1<count each group raze coords
    }
