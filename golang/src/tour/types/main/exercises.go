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

func Fibonacci() func() int {
	next, following := 0, 1
	return func() int {
		last := next
		next, following = following, next+following
		return last
	}
}
