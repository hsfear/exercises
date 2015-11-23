module Main where
import Control.Monad
import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)
import Numeric

data LispVal = Atom String
             | List [LispVal]
             | DottedList [LispVal] LispVal
             | Number Integer
             | String String
             | Bool Bool

main :: IO ()
main = do args <- getArgs
          putStrLn (readExpr (args !! 0))

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"

readExpr :: String -> String
readExpr input = case parse parseExpr "lisp" input of
    Left err -> "No Match: " ++ show err
    Right val -> "Found value"

spaces :: Parser ()
spaces = skipMany1 space

parseEscape :: Parser Char
parseEscape = do char '\\'
                 c <- anyChar
                 return $ case c of
                            'n' -> '\n'
                            'r' -> '\r'
                            't' -> '\t'
                            otherwise -> c

parseString :: Parser LispVal
parseString = do char '"'
                 x <- many (parseEscape <|> (noneOf "\""))
                 char '"'
                 return $ String x

parseAtom :: Parser LispVal
parseAtom = do first <- letter <|> symbol
               rest <- many (letter <|> digit <|> symbol)
               let atom = [first] ++ rest
               return $ case atom of
                          "#t" -> Bool True
                          "#f" -> Bool False
                          otherwise -> Atom atom

parseNumber :: Parser LispVal
-- parseNumber = liftM (Number . read) $ many1 digit
parseNumber = do digits <- many1 digit
                 base <- option Dec parseBase
                 return $ Number (readValue base digits)
-- parseNumber = (many1 digit) >>= \digits -> return $ (Number . read) digits

readValue :: (Eq a, Num a) => Base -> String -> a
readValue base digits =
    val where
          reader = case base of
                          Dec -> readDec 
                          Oct -> readOct
                          Hex -> readHex
          (val,_):_ = reader digits

data Base = Oct | Hex | Dec
parseBase :: Parser Base
parseBase = do char '#'
               base <- (char 'o' <|> char 'x')
               return $ case base of
                          'o' -> Oct
                          'x' -> Hex

parseExpr :: Parser LispVal
parseExpr = parseAtom
        <|> parseString
        <|> parseNumber
