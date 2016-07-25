// Package tempconv performs Celsius and Fahrenheit conversions.
package comma

import (
	"bytes"
	"strings"
)

// comma inserts commas in a non-negative decimal integer string.
func Comma(s string) string {
	var buf bytes.Buffer
	if strings.HasPrefix(s, "-") || strings.HasPrefix(s, "+") {
		buf.WriteString(s[0:1])
		s = s[1:]
	}

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
