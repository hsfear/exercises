// Package tempconv performs Celsius and Fahrenheit conversions.
package comma

import (
	"bytes"
)

// comma inserts commas in a non-negative decimal integer string.
func Comma(s string) string {
	var buf bytes.Buffer
	n := len(s)
	initial := n % 3
	sep := ""
	if initial > 0 {
		buf.WriteString(s[:initial])
		sep = ","
	}
	for i := initial; i < n; i += 3 {
		buf.WriteString(sep + s[i:(i+3)])
		sep = ","
	}
	return buf.String()
}
