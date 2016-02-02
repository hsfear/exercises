module Day1 where

import List exposing (..)

type alias Point = { x: Float, y: Float }
type alias Person = { name: String, age: Int, address: String }
type alias Person' = { name: String, age: Maybe(Int), address: String }

sum list = foldr (+) 0 list

xs: List({x: Float, y: Float}) -> List(Float)
xs list = map .x list

point_xs: List(Point) -> List(Float)
point_xs list = map .x list

multiply: Float -> Float -> Float
multiply n = ((*) n)

drivers: List(Person) -> List(Person)
drivers ps = filter (\p -> p.age > 16) ps

drivers': List(Person') -> List(Person')
drivers' ps = filter (\p ->
    case p.age of
        Just n -> n > 16
        _ -> False ) ps
