module Main where
import System.Environment
import Data.List

main :: IO ()
main = do args <- getArgs
          putStrLn ("Hello, " ++ intercalate " " (take 2 args))
