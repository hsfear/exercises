package main_test

import (
	"fmt"
	"testing"
	"tour/flow/main"
)

func TestMin(t *testing.T) {
	if min := main.Min(2, 1); min != 1 {
		t.Error("min did not get correct value")
	}
}

func TestSqrt(t *testing.T) {
	if sqrt := main.Sqrt(4.0); !floatEquals(sqrt, 2.0) {
		t.Error(fmt.Sprintf("sqrt did not produce correct value %f", sqrt))
	}
}

func floatEquals(a, b float64) bool {
	if (a-b) < main.EPSILON && (b-a) < main.EPSILON {
		return true
	}
	return false
}
