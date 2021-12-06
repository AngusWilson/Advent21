input:read0 `:inputs/day04.txt


d4p1:{[input]
    calls:value first input;
    snip:where ""~/:(2_input);
    boards:value each/: 5#/:(0,(1+snip)) _\: 2_input;

    i:0;
    colm:rowm:0b;
    
    while[not any[colm] or any rowm;
        nums:(i+:1)#calls;
        marked:boards in\:\: nums;

        colm:any each all each marked;
        rowm:any each all each/: marked;
        ];

    (last nums) *sum raze (first boards(where (rowm or colm)))@'where each not each first marked where (rowm or colm)
    }

d4p2:{[input]
    calls:value first input;
    snip:where ""~/:(2_input);
    boards:value each/: 5#/:(0,(1+snip)) _\: 2_input;

    i:0;
    colm:rowm:1b;
    
    while[all rowm or colm;
        nums:neg[i+:1]_calls;
        marked:boards in\:\: nums;

        colm:any each all each marked;
        rowm:any each all each/: marked;
        ];

    nums:neg[i-1]_calls;
    marked:boards in\:\: nums;
    (last nums) *sum raze (first boards(where (not rowm or colm)))@'where each not each first marked where (not rowm or colm)
    }
