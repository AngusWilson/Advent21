input:read0 `:inputs/day03.txt

d3p1:{[input]
    g:(sum each flip "1"=input)>(count[input]%2);
    (0b sv (4#0b),g)*0b sv (4#0b),not g
    }

d3p2:{[input]
    c:o:input;
    j:i:0;
    while[not count[o]=1;
        o:$[(count[o]%2)<=sum ones:"1"=o[;i];
            o where ones;
            o where not ones
            ];
        i+:1
        ];

    while[not count[c]=1;
        c:$[not (count[c]%2)<=sum ones:"1"=c[;j];
            c where ones;
            c where not ones
            ];
        j+:1
        ];

    (0b sv 0000b,first "1"=o)*0b sv 0000b,first "1"=c
    }
