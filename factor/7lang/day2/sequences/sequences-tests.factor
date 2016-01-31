USING: kernel math math.functions math.ranges math.parser sequences ascii tools.test ;

USE: day2.sequences
IN: day2.sequences.tests

{ 4 } [ { 1 2 3 4 5 } [ 3 > ] find-first ] unit-test
{ f } [ { 1 2 3 4 5 } [ 8 > ] find-first ] unit-test
