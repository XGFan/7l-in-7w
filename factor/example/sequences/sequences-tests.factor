USING: io math kernel example.sequences tools.test ;
IN: example.sequences.tests

{ f } [ [ 1 3 5 7 ] [ 2 = ] find-first ] unit-test
{ 3 } [ [ 1 3 5 7 ] [ 3 = ] find-first ] unit-test
{ 1 } [ [ 1 3 5 7 ] [ 2 mod 1 = ] find-first ] unit-test