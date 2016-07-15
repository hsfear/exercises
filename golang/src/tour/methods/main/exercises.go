package main

import (
	"fmt"
	"strings"
)

type IPAddr [4]byte

func (ipaddr IPAddr) String() string {
	var quads []string
	for _, b := range ipaddr {
		quads = append(quads, fmt.Sprintf("%v", b))
	}
	return strings.Join(quads, ".")
}

var EPSILON float64 = 0.00000001

type ErrNegativeSqrt float64

func (e ErrNegativeSqrt) Error() string {
	return fmt.Sprintf("cannot Sqrt negative number: %s", fmt.Sprint(float64(e)))
}

func Sqrt(x float64) (float64, error) {
	if x < 0 {
		return 0, ErrNegativeSqrt(x)
	}
	high := x
	low := 0.0
	for (high - low) > EPSILON {
		mid := low + ((high - low) / 2.0)
		if (mid * mid) < x {
			low = mid
		} else {
			high = mid
		}
	}
	return low, nil
}

type MyReader struct{}

func (myReader MyReader) Read(buffer []byte) (int, error) {
	buffer[0] = 'A'
	return 1, nil
}
