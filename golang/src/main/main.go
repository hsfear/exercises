package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	rand.Seed(time.Now().UTC().UnixNano())
	fmt.Printf("%c\n", byte('A')+byte(rand.Intn(26)))
}
