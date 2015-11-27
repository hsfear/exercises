import Test.HUnit
import Data.Char (digitToInt)

asInt_fold :: String -> Int
asInt_fold ('-':xs) = 0 - asInt_fold xs
asInt_fold s = foldl (\a b -> a * 10 + digitToInt b) 0 s

asInt_fold_tests = test [ "asInt_fold" ~: asInt_fold "101" ~?= 101,
                          "asInt_fold" ~: asInt_fold "-31337" ~?= (-31337)]

concat_fold :: [[a]] -> [a]
concat_fold [] = []
concat_fold xs = foldr (++) [] xs
concat_fold_tests = test [ "concat_fold" ~: concat_fold [[1,2,3],[4,5,6]] ~?= [1,2,3,4,5,6]]

gt10 :: Int -> Bool
gt10 x = x > 10

takeWhile_fold :: (a -> Bool) -> [a] -> [a]
takeWhile_fold f xs = foldr (\a b -> if f a then a : b else []) [] xs
takeWhile_fold_tests = test [ "takeWhile_fold" ~: takeWhile_fold (>10) [20, 30, 40, 1, 20, 2, 30] ~?= [20, 30, 40]]
