package anagrams_test

import (
	"gobook/ch3/anagrams"
	"testing"
)

var data = []struct {
	s1       string
	s2       string
	expected bool
}{
	{"", "", true},
	{"a", "", false},
	{"a", "a", true},
	{"ab", "a", false},
	{"ba", "a", false},
	{"ab", "ab", true},
	{"ab", "aba", false},
	{"aba", "ab", false},
	{"aba", "aba", true},
}

func TestAreAnagrams(t *testing.T) {
	for _, values := range data {
		if actual := anagrams.AreAnagrams(values.s1, values.s2); values.expected != actual {
			t.Errorf("Comparing %s with %s: expected: %v, actual: %v", values.s1, values.s2, values.expected, actual)
		}
	}
}
