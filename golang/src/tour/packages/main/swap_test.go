package main_test

import (
	"testing"
	"tour/packages/main"
)

func TestSwap(t *testing.T) {
	a, b := main.Swap("1", "2")
	if a != "2" {
		t.Error("a did not get correct value")
	}
	if b != "1" {
		t.Error("b did not get correct value")
	}

}
