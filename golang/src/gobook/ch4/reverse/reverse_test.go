package reverse_test

import (
	"gobook/ch4/reverse"
	"reflect"
	"testing"
)

func TestAreAnagrams(t *testing.T) {
	xs := []int{0, 1, 2, 3, 4, 5}
	reverse.Reverse(xs)
	if !reflect.DeepEqual(xs, []int{5, 4, 3, 2, 1, 0}) {
		t.Errorf("Reversing %s returned %v", []int{0, 1, 2, 3, 4, 5}, xs)
	}
}
