USING: kernel math math.functions math.ranges math.parser sequences ascii tools.test ;

USE: day2.sequences
IN: day2.sequences.tests

{ f } [ { } [ 3 > ] find-first ] unit-test
{ 7 } [ { 7 } [ 3 > ] find-first ] unit-test
{ f } [ { 1 2 3 } [ 3 > ] find-first ] unit-test
{ 7 } [ { 7 1 2 3 4 5 } [ 3 > ] find-first ] unit-test
{ 4 } [ { 1 2 3 4 5 } [ 3 > ] find-first ] unit-test
