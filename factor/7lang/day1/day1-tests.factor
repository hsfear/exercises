USING: kernel math math.functions math.ranges math.parser sequences ascii tools.test ;
IN: day1.tests

{ 25 } [ 3 3 * 4 4 * + ] unit-test
{ 5.0 } [ 3 sq 4 sq + sqrt ] unit-test
{ 112 } [ 12 100 + ] unit-test
{ "HELLO HOWARD" } [ "Howard" "Hello " swap append >upper ] unit-test
{ 42 } [ { 1 4 17 9 11 } 0 [ + ] reduce ] unit-test
{ 5050 } [ 100 [1,b] 0 [ + ] reduce ] unit-test
{ { 1 4 9 16 25 36 49 64 81 100 } } [ 10 [1,b] [ sq ] map ] unit-test
{ 4 2 } [ 42 [ 10 /i ] [ 10 mod ] bi ] unit-test
{ 9 1 2 } [ 912 number>string 1string [ string>number ] each ] unit-test
