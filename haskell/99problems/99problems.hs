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
                       "myFlatten (List [])" ~: null (myFlatten (List [])) ~?= True,
                       "myFlatten complex" ~: myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) ~?= [1,2,3,4,5]]
