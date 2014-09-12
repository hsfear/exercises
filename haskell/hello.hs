x :: Int
x = 100

hello :: String
hello = "Hello, world"

f :: Int -> Int
f n = n + 10

g :: Int -> Int
g = (\n -> n + n)


infixl  9 ^&^
(^&^) :: Int -> Int -> Int
(^&^) _ _ = 42

data Person = Person {
    fn :: String,
    ln :: String
} deriving Show

data Maybee a = Juste a | Nothinge deriving Show

something :: Maybee Int
something = Juste 10

nothing :: Maybee Int
nothing = Nothinge
