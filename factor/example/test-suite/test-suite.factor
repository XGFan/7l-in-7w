USING: tools.test io io.streams.null kernel namespaces sequences ;
USE: example.greeter
USE: example.hello
USE: example.strings
IN: example.test-suite

: test-all-examples ( -- )
    "example" test
    ! [ "example" test ] with-null-writer
    test-failures get empty?
    [ "ALL tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-examples
