package main

var EPSILON float64 = 0.00000001

func Min(x, y int) int {
	if x < y {
		return x
	} else {
		return y
	}
}

func Sqrt(x float64) float64 {
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
	return low
}
