package main

import (
	"os"
	"testing"
)

func BenchmarkEcho1(b *testing.B) {
	for n := 0; n < b.N; n++ {
		echo1(os.Args)
	}
}

func BenchmarkEcho2(b *testing.B) {
	for n := 0; n < b.N; n++ {
		echo2(os.Args)
	}
}
