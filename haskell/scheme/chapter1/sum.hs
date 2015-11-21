module Main where
import System.Environment
import Data.List

main :: IO ()
main = do args <- getArgs
          -- putStrLn ("sum: " ++ flatten (cargs args))
          putStrLn ("Sum: " ++ (show (sum (map (\a -> read a::Int) args))))
