module Day1 where

import List exposing (..)

type alias Point = { x: Float, y: Float }
type alias Address = { line1: String, line2: String, city: String, state: String, zipcode: String }
type alias Person = { name: String, age: Int, address: Address }

sum list = foldr (+) 0 list

xs: List({x: Float, y: Float}) -> List(Float)
xs list = map .x list

point_xs: List(Point) -> List(Float)
point_xs list = map .x list
