package main

import (
	"fmt"
	"math/rand"
	"time"
)

func add(x int, y int) int {
	return x + y
}

func main() {
	rand.Seed(time.Now().UnixNano())
	fmt.Printf("My favorite number is %d\n", rand.Intn(10))
	fmt.Printf("My favorite addition is %d\n", rand.Intn(10)+rand.Intn(10))
}
