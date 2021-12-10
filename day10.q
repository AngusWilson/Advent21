input:read0 `:inputs/day10.txt

push:{.aoc.stack,:x}

pop:{out:last .aoc.stack;
    .aoc.stack:-1_.aoc.stack;
    out
    }

checkSyntax:{[line]
    i:0;
    .aoc.stack:syntaxErr:();
    while[(i<count line) and not count syntaxErr;
        if[line[i] in"[{(<";
            push line i;
            ];
        if[line[i] in "]})>";
            if[not pop[]~("]})>"!"[{(<") line[i];
                syntaxErr:line[i];
                ];
            ];
        i+:1;
        ];
    :syntaxErr
    }

d10p1:{[input]
    sum (")]}>"!(3 57 1197 25137)) raze checkSyntax each input
    }



checkSyntax:{[line]
    i:0;
    .aoc.stack:syntaxErr:();
    while[(i<count line) and not count syntaxErr;
        if[line[i] in"[{(<";
            push line i;
            ];
        if[line[i] in "]})>";
            if[not pop[]~("]})>"!"[{(<") line[i];
                syntaxErr:line[i];
                ];
            ];
        i+:1;
        ];
    if[count syntaxErr;
        :()
        ];
    :.aoc.stack
    }

d10p2:{
    med ({y+5*x}/[0;] each ("([{<"!1 2 3 4) reverse each checkSyntax each input) except 0
    }
