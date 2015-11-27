import Data.Char  
  
-- main = do  
--     contents <- getContents  
--     putStrLn . show $ lines contents

main = interact $ showIt . lines
  where showIt string = show string ++ "\n"
       
