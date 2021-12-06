input:read0 `:inputs/day06.txt
input:value first input

d6:{[days;input]
    fishages:value ((value each -1_.Q.n)!9#0),count each group input;
    do[days;    
        fishages:rotate[1;fishages];
        fishages[6]+:fishages[8];
        ];
    sum fishages
    }
