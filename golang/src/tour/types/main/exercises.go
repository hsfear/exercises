package main

import (
	"strings"
)

func WordCount(s string) map[string]int {
	counts := make(map[string]int)
	for _, word := range strings.Fields(s) {
		n, _ := counts[word]
		counts[word] = n + 1
	}
	return counts
}
