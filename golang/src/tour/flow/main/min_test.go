package main_test

import (
	"testing"
	"tour/flow/main"
)

func TestMin(t *testing.T) {
	min := main.Min(2, 1)
	if min != 1 {
		t.Error("min did not get correct value")
	}
}
