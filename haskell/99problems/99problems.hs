import Test.HUnit

--
-- Problem 1
--

myLast :: [a] -> a

myLast (x:[]) = x
myLast (x:xs) = myLast xs
myLastTest = test [ "myLast [1,2,3,4]" ~: myLast [1,2,3,4] ~?= 4,
                    "myLast ['x','y','z']" ~: myLast ['x','y','z'] ~?= 'z']

--
-- Problem 2
--

myButLast :: [a] -> a

myButLast (x:y:[]) = x
myButLast (x:y:xs) = myButLast (y:xs)
myButLastTest = test [ "myButLast [1,2,3,4]" ~: myButLast [1,2,3,4] ~?= 3,
                       "myButLast ['a'..'z']" ~: myButLast ['a'..'z'] ~?= 'y']

--
-- Problem 3
--

elementAt :: [a] -> Integer -> a

elementAt (x:xs) 1 = x
elementAt (x:xs) n = elementAt xs (n - 1)
elementAtTest = test [ "elementAt [1,2,3] 2" ~: elementAt [1,2,3] 2 ~?= 2,
                       "elementAt string" ~: elementAt "haskell" 5 ~?= 'e']

--
-- Problem 4
--

myLength :: [a] -> Integer

myLength [] = 0
myLength (_:xs) = 1 + myLength xs
myLengthTest = test [ "myLength [123,456,789]" ~: myLength [123,456,789] ~?= 3,
                      "myLength string" ~: myLength "Hello, World!" ~?= 13]

--
-- Problem 5
--

myReverse :: [a] -> [a]

myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]
myReverseTest = test [ "myReverse [1,2,3,4]" ~: myReverse [1,2,3,4] ~?= [4,3,2,1],
                       "myReverse string" ~: myReverse "A man, a plan, a canal, panama!" ~?= "!amanap ,lanac a ,nalp a ,nam A"]

--
-- Problem 6
--

isPalindrome :: Eq a => [a] -> Bool

isPalindrome x = x == (reverse x)
isPalindromeTest = test [ "isPalindrome [1,2,3,4]" ~: isPalindrome [1,2,3] ~?= False,
                          "isPalindrome string" ~: isPalindrome "madamimadam" ~?= True,
                          "isPalindrome [1,2,4,8,16,8,4,2,1]" ~: isPalindrome [1,2,4,8,16,8,4,2,1] ~?= True]

--
-- Problem 7
--

data NestedList a = Elem a | List [NestedList a]
myFlatten :: NestedList a -> [a]

myFlatten (Elem a) = [a]
myFlatten (List []) = []
myFlatten (List (x:xs)) = (myFlatten x) ++ (myFlatten (List xs))
myFlattenTest = test [ "myFlatten (Elem 5)" ~: myFlatten (Elem 5) ~?= [5],
--                     Have to explicitly type the empty list otherwise its a compile error.
--                     see http://stackoverflow.com/questions/5410919/hunit-testcase-with-a-type-error
                       "myFlatten (List [])" ~: myFlatten (List []) ~?= ([] :: [Int]),
                       "myFlatten complex" ~: myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) ~?= [1,2,3,4,5]]

--
-- Problem 8
--

compress :: Eq a => [a] -> [a]

compress [] = []
compress (x:[]) = [x]
compress (x:y:xs) = if x == y then compress (y:xs) else x : compress (y:xs)
compressTest = test [ "compress string" ~: compress "aaaabccaadeeee" ~?= "abcade",
                      "compress ints" ~: compress [1,2,2,3,3,3,4,4,4,4] ~?= [1,2,3,4],
--                    Have to explicitly type the empty list otherwise its a compile error.
--                    see http://stackoverflow.com/questions/5410919/hunit-testcase-with-a-type-error
                      "compress null" ~: compress [] ~?= ([] :: [Int]) ]

--
-- Problem 9
--

pack :: Eq a => [a] -> [[a]]

pack [] = [[]]
pack (x:xs) = packem x [x] xs
  where
    packem c list [] = [list]
    packem c list (y:ys) = if y == c
      then packem c (c : list) ys
      else [list] ++ packem y [y] ys
packTest = test [ "pack string" ~: pack "aaaabccaadeeee" ~?= ["aaaa","b","cc","aa","d","eeee"],
--                Have to explicitly type the empty list otherwise its a compile error.
--                see http://stackoverflow.com/questions/5410919/hunit-testcase-with-a-type-error
                  "pack null" ~: pack [] ~?= ([[]] :: [[Char]]) ]

--
-- Problem 10
--

encode :: [Char] -> [(Int, Char)]

encode [] = []
encode xs = [(length x, head x) | x <- (pack xs)]
encodeTest = test [ "encode string" ~: encode "aaaabccaadeeee" ~?= [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')],
                    "encode null" ~: encode [] ~?= [] ]

--
-- Problem 11
--

data Encoded = Multiple Int Char | Single Char deriving (Show, Eq)
encodeModified :: [Char] -> [Encoded]

encodeModified [] = []
encodeModified xs = [ construct x | x <- (pack xs) ]
  where
    construct (x:[]) = Single x
    construct xs = Multiple (length xs) (head xs)
encodeModifiedTest = test [ "encodeModified string" ~: encodeModified "aaaabccaadeeee" ~?=
                                ([Multiple 4 'a',Single 'b', Multiple 2 'c', Multiple 2 'a', Single 'd',Multiple 4 'e']),
                            "encodeModified null" ~: encodeModified "" ~?= [] ]

--
-- Problem 12
--

decodeModified :: [Encoded] -> [Char]

decodeModified [] = []
decodeModified (Single char : xs) = char : (decodeModified xs)
decodeModified (Multiple count char : xs) = (replicate count char) ++ decodeModified xs
decodeModifiedTest = test [ "decodeModified string" ~: decodeModified [Multiple 4 'a',Single 'b', Multiple 2 'c',
                                                                       Multiple 2 'a', Single 'd',Multiple 4 'e'] ~?= "aaaabccaadeeee",
                            "decodeModified null" ~: decodeModified [] ~?= "" ]

--
-- Problem 13
--

encodeDirect :: [Char] -> [Encoded]

encodeDirect [] = []
encodeDirect (x:xs) =
  let these = takeWhile (==x) xs
      count = length these + 1
  in (if count > 1 then Multiple count x else Single x) : encodeDirect (dropWhile (==x) xs)
encodeDirectTest = test [ "encodeDirect string" ~: encodeDirect "aaaabccaadeeee" ~?=
                                ([Multiple 4 'a',Single 'b', Multiple 2 'c', Multiple 2 'a', Single 'd',Multiple 4 'e']),
                            "encodeDirect null" ~: encodeDirect "" ~?= [] ]
