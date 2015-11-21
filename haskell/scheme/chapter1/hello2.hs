module Main where
import System.Environment
import Data.List

main :: IO ()
main
  = do
     putStr ("Name: ")
     name <- getLine
     putStrLn ("Hello, " ++ name)
