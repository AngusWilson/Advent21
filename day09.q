input:read0 `:inputs/day09.txt

d9p1:{[input]
    grid:(`int$input)-48;
    i:j:0;
    minloc:()
    while[i<count grid;
        while[j<count first grid;
            if[all grid[i;j]</:(grid ./: (i;j)+'/:(0 -1;0 1;-1 0;1 0))except 0N;
                minloc,:enlist[(i;j)]!enlist[grid[i;j]];
                ];
            j+:1;
            ];
        j:0;
        i+:1;
        ];

    sum 1+value minloc
    }

    
d9p2:{[input]   
    grid:(`int$input)-48;
    bool:grid<>9;
    
 
   .aoc.basins:()!();
   .aoc.basins,:enlist[1]!enlist();
   .aoc.currentBasinID:1;
   
    
   ff:{[node]
    if[all node in .aoc.basins[.aoc.currentBasinID];
        :0b;
        ];
    if[not bool . node;
        :0b;
        ];
    .aoc.basins[.aoc.currentBasinID],:enlist node;
    ff node+(1 0);
    ff node+(-1 0);
    ff node+(0 -1);
    ff node+(0 1);
    1b
    };
    
    .aoc.currentBasinID:i:j:0;
    while[j<count bool;
        while[i<count first bool;
            if[bool . (j; i);
                if[not all (j;i) in raze value .aoc.basins;
                    .aoc.currentBasinID+:1;
                   .aoc.basins,:enlist[.aoc.currentBasinID]!enlist();
                   ff[(j;i)];
                ];
            ];
            i+:1;
            ];
        i:0;
        j+:1;
        ];
    
    prd 3# desc count each .aoc.basins
    }
