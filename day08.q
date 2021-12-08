input:read0 `:inputs/day08.txt

d8p1:{[input]
    blocks:(til 10 )! 6 2 5 5 4 5 6 3 7 6;
    sum (count each raze " " vs/: last each "| " vs/: input ) in (blocks 1 4 7 8)
    }

d8p1:{[input]
    sumrow:{[row]
        c:count each split:" " vs first " | " vs row;
        blocks: 6 2 5 5 4 5 6 3 7 6!(til 10 );
        d:1 4 7 8#(blocks c)!split;

        top:first d[7] except d[1];

        middles:(inter/) (split where c= 5);
        center:(count each group sixc where (sixc:raze (split where c= 6) ) in middles )?2;
        bottom:first middles except center,top;
        topleft:first d[4] except d[1],center;

        five:first  fives where any each (fives:split where c=5) in/: topleft;
        bottomright:first five except middles,topleft;

        topright:first d[1] except bottomright;
        bottomleft:first d[8] except middles,topleft,topright,bottomright;

        pos:(top;topleft;topright;center;bottomleft;bottomright;bottom);

        map:(1110111b;
            0010010b;
            1011101b;
            1011011b;
            0111010b;
            1101011b;
            1101111b;
            1010010b;
            1111111b;
            1111011b)!til 10;

        nums:" " vs last " | " vs row;

        value raze string map (pos in/:nums)
        };

    sum sumrow each input
    }
