// Package tempconv performs Celsius and Fahrenheit conversions.
package comma

// comma inserts commas in a non-negative decimal integer string.
func Comma(s string) string {
	n := len(s)
	if n <= 3 {
		return s
	}
	return Comma(s[:n-3]) + "," + s[n-3:]
}
