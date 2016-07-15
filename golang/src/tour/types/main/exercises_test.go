package main_test

import (
	"fmt"
	"reflect"
	"testing"
	"tour/types/main"
)

func TestWordCount(t *testing.T) {
	counts := main.WordCount("hello world")
	if val, ok := counts["hello"]; ok == false || val != 1 {
		t.Error(fmt.Sprintf("Did not return the correct count %d for hello", val))
	}
}

func TestFibonacci(t *testing.T) {
	fibs := main.Fibonacci()
	firstfive := []int{fibs(), fibs(), fibs(), fibs(), fibs()}
	if !reflect.DeepEqual(firstfive, []int{0, 1, 1, 2, 3}) {
		t.Error("Did not return the correct sequence", fibs)
	}
}
