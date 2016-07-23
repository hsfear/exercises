package popcount

import (
	"math"
	"testing"
)

var data = []struct {
	i        uint64
	popcount int
}{
	{0, 0},
	{1, 1},
	{7, 3},
	{math.MaxUint64, 64},
}

func TestPopCount(t *testing.T) {
	for _, values := range data {
		if values.popcount != PopCount(values.i) {
			t.Errorf("Failed to get correct population count for %d: expected %d, got %d", values.i, values.popcount, PopCount(values.i))
		}
	}
}

func TestPopCount2(t *testing.T) {
	for _, values := range data {
		if values.popcount != PopCount2(values.i) {
			t.Errorf("Failed to get correct population count for %d: expected %d, got %d", values.i, values.popcount, PopCount(values.i))
		}
	}
}

func BenchmarkPopCount(b *testing.B) {
	for n := 0; n < b.N; n++ {
		PopCount(math.MaxUint64)
	}
}

func BenchmarkPopCount2(b *testing.B) {
	for n := 0; n < b.N; n++ {
		PopCount2(math.MaxUint64)
	}
}
