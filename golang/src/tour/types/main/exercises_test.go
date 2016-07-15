package main_test

import (
	"fmt"
	"testing"
	"tour/types/main"
)

func TestWordCount(t *testing.T) {
	counts := main.WordCount("hello world")
	if val, ok := counts["hello"]; ok == false || val != 1 {
		t.Error(fmt.Sprintf("Did not return the correct count %d for hello", val))
	}
}
