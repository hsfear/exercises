USING: day3.checkout tools.test arrays accessors ;

IN: day3.checkout.tests

{ 49.98 } [ "7lang2" 24.99 2 <cart-item> cart-item-price ] unit-test

! START:sample_test
: <sample-cart> ( -- cart ) 
  "7lang2" 24.99 2 <cart-item> "noderw" 10.99 1 <cart-item> 2array ;

! END:sample_test
{ 60.97 } [ <sample-cart> cart-base-price ] unit-test
{ 3 } [ <sample-cart> cart-item-count ] unit-test

{ T{ checkout f 3 60.97 f f f } }
[ <sample-cart> <checkout> ]
unit-test

! START:sample_test
{ T{ checkout f 3 60.97 9.130257500000001 4.49 74.59025750000001 } }
[ <sample-cart> <checkout> sample-checkout ]
unit-test
! END:sample_test

! START:us_taxes_test
{ 1.00 }
[ T{ cart-item f "Test" 10.00 1 } 1array <checkout> [ sales-tax ] taxes taxes>> ]
unit-test
! END:sample_test

! START:us_shipping_test
{ 3.49 }
[ T{ cart-item f "Test" 10.00 1 } 1array <checkout> [ per-us-item ] shipping shipping>> ]
unit-test
! END:sample_test

! START:sample_test
{ T{ checkout f 1 10.0 1.0 3.49 14.49 } }
[ T{ cart-item f "Test" 10.00 1 } 1array <checkout> sample-us-checkout ]
unit-test
! END:sample_test
