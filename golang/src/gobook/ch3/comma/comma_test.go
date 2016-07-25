package comma

import (
	"testing"
)

var data = []struct {
	s        string
	expected string
}{
	{"", ""},
	{"1", "1"},
	{"123", "123"},
	{"1234", "1,234"},
	{"123456", "123,456"},
	{"1234567", "1,234,567"},
	{"-123456", "-123,456"},
	{"-1234567", "-1,234,567"},
	{"+123456", "+123,456"},
	{"+1234567", "+1,234,567"},
}

func TestComma(t *testing.T) {
	for _, values := range data {
		if actual := Comma(values.s); values.expected != actual {
			t.Errorf("Failed to insert commas into %s: expected: %s, actual: %s", values.s, values.expected, actual)
		}
	}
}
