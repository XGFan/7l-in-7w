USING: kernel sequences ;
IN: example.strings

: palindrome? ( str -- flag ) dup reverse = ;