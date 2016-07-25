// Package anagrams determines whether two strings are anagrams
package anagrams

import (
	"bytes"
)

// Checks whether two strings are anagrams.  (Note: does not work with runes.)
func AreAnagrams(s1 string, s2 string) bool {
	s1bytes := []byte(s1)
	for _, char := range s2 {
		i := bytes.IndexRune(s1bytes, char)
		if i == -1 {
			return false
		}
		s1bytes = append(s1bytes[:i], s1bytes[i+1:]...)
	}
	return len(s1bytes) == 0
}
