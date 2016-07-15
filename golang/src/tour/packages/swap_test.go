package packages_test

import (
	"testing"
	"tour/packages"
)

func TestSwap(t *testing.T) {
	a, b := packages.Swap("1", "2")
	if a != "2" {
		t.Error("a did not get correct value")
	}
	if b != "1" {
		t.Error("b did not get correct value")
	}

}
