package main

import "os/exec"
import "fmt"

// Execute AWS commands
func snsList() string {


	snsCmd := exec.Command("bash", "-c", "aws sns list-topics --output json")
	snsOut, err := snsCmd.CombinedOutput()
	if err != nil {
		fmt.Println("Error running: aws sns list-topics")
		panic(err)
	}

	m := string(snsOut)
	// First test is if the most recent update actually has a merge message
	if m == "" {
		panic("No message was obtained from aws sns list-topics")
	}

	return m
}
func main(){

	// var configFile string = "./package.json"

	// Less simpler printing
	p := fmt.Println

	p(snsList())
}
