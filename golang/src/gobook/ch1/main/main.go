package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	echo1(os.Args)
}

func echo1(args []string) {
	fmt.Println(strings.Join(args, "\n"))
}

func echo2(args []string) {
	for i, val := range args {
		fmt.Printf("%d: %s\n", i, val)
	}
}
