USING: kernel math math.functions math.ranges math.parser sequences ascii tools.test ;

USE: day2.strings
IN: day2.strings.tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "racecars" palindrome? ] unit-test
