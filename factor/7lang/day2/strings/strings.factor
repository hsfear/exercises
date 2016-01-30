USING: kernel sequences ascii ;
IN: day2.strings

: palindrome? ( str -- ? ) dup reverse = ;
