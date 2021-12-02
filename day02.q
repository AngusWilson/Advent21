input:read0 `:inputs/day02.txt

d2p1:{[input]
    split:" " vs/: input;
    n:split[;1];
    d:split[;0];
    x:sum"I"$n where "forward"~/:d;

    y:(sum"I"$n where "down"~/:d)-(sum"I"$n where "up"~/:d);

    x*y}


d2p2:{[input]
    
    t:([]direction:`$split[;0];n:"I"$split[;1])
    t:update neg n from t where direction=`up;
    t:update direction:`aimChange from t where not direction=`forward;
    t:update aim: sums n from t where direction=`aimChange;
    t:update 0^fills aim from t;
    
    t:update x:sums n from t where direction=`forward;
    t:update fills x from t;
    
    t:update ychange:n*aim from t where direction=`forward;

    (sum t`ychange)*last t`x
    }
    
