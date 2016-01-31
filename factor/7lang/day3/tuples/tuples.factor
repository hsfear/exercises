! START:definition
USING: kernel math accessors ;

IN: day3.tuples

TUPLE: cart-item name price quantity ;
! END:definition

! START:partial_boa
: <dollar-cart-item> ( name -- cart-item ) 1.00 1 cart-item boa ;
! END:partial_boa

! START:key_value
: <one-cart-item> ( -- cart-item ) T{ cart-item { quantity 1 } } ;
! END:key_value

! START:partial_boa
: <simple-cart-item> ( price -- cart-item ) "Default" swap 1 cart-item boa ;
! END:partial_boa

: discount ( cart-item discount -- cart-item )
    1 swap - ! convert discount into something we can multiply 
    [ * ] curry ! curry it to create a callable
    change-price ;
