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

	end := len(s)
	if decimal := strings.Index(s, "."); decimal > -1 {
		end = decimal
	}
	initial := end % 3
	sep := ""
	if initial > 0 {
		buf.WriteString(s[:initial])
		sep = ","
	}
	for i := initial; i < end; i += 3 {
		buf.WriteString(sep + s[i:(i+3)])
		sep = ","
	}
	if l := len(s); end < l {
		buf.WriteString(s[end:l])
	}
	return buf.String()
}
