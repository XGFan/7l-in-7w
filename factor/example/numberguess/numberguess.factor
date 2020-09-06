USING: io kernel sequences namespaces math math.parser random.private ;
IN: example.numberguess

SYMBOL: g
: compare ( n -- i ) dup g get = [ "success" print flush 0 * ] [ g get > [ "greater than" print flush 1 ] [  "less than" print flush -1 ] if ] if ;
: getNumber ( -- i ) readln string>number ;
: guess ( -- ) 100 random-integer 1 + g set getNumber [ dup compare 0 = [ f ] [ drop getNumber t ] if ] loop drop ;

MAIN: guess