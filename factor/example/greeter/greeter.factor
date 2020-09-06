USING: kernel sequences ;
IN: example.greeter

: greeting ( name -- str ) "hello, " swap append ;