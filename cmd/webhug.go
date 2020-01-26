package main

import (
	"bufio"
	"fmt"
	"github.com/phramz/webhug/pkg/crypto"
	"log"
	"net/http"
	"os"
	"strings"
	"sync"
)

func main() {
	endpoint := os.Args[1]
	secret := os.Args[2]
	ctype := os.Args[3]
	payload := os.Args[4]
	client := &http.Client{}

	req, err := http.NewRequest("POST", endpoint, strings.NewReader(payload))
	if err != nil {
		log.Fatal(err)
	}

	req.Header.Add("content-type", ctype)
	req.Header.Add("x-hub-signature", crypto.GithubSign([]byte(payload), []byte(secret)))
	resp, err := client.Do(req)
	if err != nil {
		log.Fatal(err)
	}

	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		scanner := bufio.NewScanner(resp.Body)
		for scanner.Scan() {
			fmt.Println(scanner.Text())
		}

		wg.Done()
	}()

	wg.Wait()

	os.Exit(0)
}
