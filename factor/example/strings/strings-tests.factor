USING: example.strings tools.test ;
IN: example.strings.tests

{ f } [ "hello-world" palindrome? ] unit-test
{ t } [ "ADA" palindrome? ] unit-test