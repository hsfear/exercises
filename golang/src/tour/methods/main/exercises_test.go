package main_test

import (
	"fmt"
	"testing"
	"tour/methods/main"
)

func TestStringer(t *testing.T) {
	if s := fmt.Sprint(main.IPAddr{127, 0, 0, 1}); s != "127.0.0.1" {
		t.Error(fmt.Sprintf("Did not return the correct string %s for 127.0.0.1", s))
	}
}

func TestSqrt(t *testing.T) {
	_, err := main.Sqrt(-4.0)

	if err == nil {
		t.Error("sqrt did not return an error")
	}

	if s := fmt.Sprint(err); s != "cannot Sqrt negative number: -4" {
		t.Error(fmt.Sprintf("sqrt did not return correct error string %s", s))
	}
}
