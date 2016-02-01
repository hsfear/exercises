module Day1 where

import List

sum list = List.foldr (+) 0 list
