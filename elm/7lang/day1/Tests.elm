module Tests where

import ElmTest exposing (..)

import String

import Day1

all : Test
all =
    suite "Day1 Test Suite"
        [
            test "Sum elements" (assertEqual (Day1.sum [1,2,3]) 6)
        ]
