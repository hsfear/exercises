package tempconv

import (
	"testing"
)

var data = []struct {
	c Celsius
	f Fahrenheit
	k Kelvin
}{
	{0, 32, 273.15},
	{10, 50, 283.15},
	{100, 212, 373.15},
}

func TestCToF(t *testing.T) {
	for _, values := range data {
		if values.f != CToF(values.c) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.c, values.f, CToF(values.c))
		}
	}
}

func TestCToK(t *testing.T) {
	for _, values := range data {
		if values.k != CToK(values.c) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.c, values.k, CToK(values.c))
		}
	}
}

func TestFToC(t *testing.T) {
	for _, values := range data {
		if values.c != FToC(values.f) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.f, values.c, FToC(values.f))
		}
	}
}

func TestFToK(t *testing.T) {
	for _, values := range data {
		if values.k != FToK(values.f) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.f, values.k, FToK(values.f))
		}
	}
}

func TestKToC(t *testing.T) {
	for _, values := range data {
		if values.c != KToC(values.k) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.k, values.c, KToC(values.k))
		}
	}
}

func TestKToF(t *testing.T) {
	for _, values := range data {
		if values.f != KToF(values.k) {
			t.Errorf("Failed to convert %s: expected %s, got %s", values.k, values.f, KToF(values.k))
		}
	}
}
