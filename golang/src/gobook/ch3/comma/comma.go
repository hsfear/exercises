// Package tempconv performs Celsius and Fahrenheit conversions.
package comma

import (
	"bytes"
	"strings"
)

// comma inserts commas in a non-negative decimal integer string.
func Comma(s string) string {
	var buf bytes.Buffer
	n := len(s)
	start := 0
	if strings.HasPrefix(s, "-") {
		buf.WriteString(s[0:1])
		start = 1
	}
	initial := (n - start) % 3
	sep := ""
	if initial > 0 {
		buf.WriteString(s[start : start+initial])
		sep = ","
	}
	for i := start + initial; i < n; i += 3 {
		buf.WriteString(sep + s[i:(i+3)])
		sep = ","
	}
	return buf.String()
}
