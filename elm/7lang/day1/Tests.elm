module Tests where

import ElmTest exposing (..)

import String
import List exposing (..)

import Day1

all : Test
all =
    suite "Day1 Test Suite"
        [
            test "Sum elements" (assertEqual (Day1.sum [1,2,3]) 6),
            test "record accessors " (assertEqual (Day1.xs [{x = 1, y=2}, {x =3, y=4}]) [1,3]),
            test "Point accessors " (assertEqual (Day1.point_xs [{x = 1, y=2}, {x =3, y=4}]) [1,3]),
            test "multiply " (assertEqual (Day1.multiply 6 8) 48),
            test "drivers " (assertEqual (Day1.drivers [{name = "Mom", age=33, address="test"},{name = "Dad", age=38, address="test"},{name = "Kid", age=6, address="test"} ])
                [{name = "Mom", age=33, address="test"},{name = "Dad", age=38, address="test"}]),
            test "drivers " (assertEqual (Day1.drivers' [{name="Mom", age=Just 33, address="test"},
                                                         {name="Dad", age=Just 38, address="test"},
                                                         {name="Kid", age=Just 6, address="test"},
                                                         {name="Baby", age=Nothing, address="test"} ])
                [{name = "Mom", age=Just 33, address="test"},{name = "Dad", age=Just 38, address="test"}])
        ]
