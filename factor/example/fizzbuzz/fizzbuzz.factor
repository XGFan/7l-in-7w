USING: kernel sequences ;
IN: example.fizzbuzz

: mult ( int check -- result ) over number?  [ call ]  [ 2drop f ] if ; inline
: fizz ( int -- result ) dup [ 3 mod 0 = ] mult not swap "fizz" ? ;
: buzz ( int -- result ) dup [ 5 mod 0 = ] mult not swap "fizz" ? ;

: fizz ( int -- result ) dup number? [ dup 3 mod 0 =  [ drop "fizz" ] when ] when ;
: buzz ( int -- result ) dup number? [ dup 5 mod 0 =  [ drop "buzz" ] when ] when ;

: fizzbuzz ( int -- result ) dup 15 mod 0 = [ drop "fizzbuzz" ] when ;

: all ( int -- x ) fizzbuzz fizz buzz ;
