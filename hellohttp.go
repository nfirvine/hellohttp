package main // import "github.com/nfirvine/hellohttp"

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hellohttp version %s\n\nYour headers:\n", Version)
	for k, v := range r.Header {
		fmt.Fprintf(w, "%v: %v\n", k, v)
	}
}

func main() {
	http.HandleFunc("/", helloHandler)

	fmt.Println("Started, serving at 80")
	err := http.ListenAndServe(":80", nil)
	if err != nil {
		panic("ListenAndServe: " + err.Error())
	}
}
