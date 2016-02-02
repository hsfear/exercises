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
            test "Point accessors " (assertEqual (Day1.point_xs [{x = 1, y=2}, {x =3, y=4}]) [1,3])
        ]
