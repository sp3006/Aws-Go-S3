package main

func main(){
	const welcome string = "Hello World"
	//welcome :=  "Hello World" 
	println(welcome)

	//short variable declaration
	myage := 23
    myage -= 10
	println(myage)

	const pi float64 = 3.14
	println(pi)

	var size float64 = 1.5
	println(pi * size)

	// store height
	var customerHeight int = 160
	customerAge := 18
	if customerHeight >= 150{
		println("Allowed")
	} else{
		println("Not Allowed")
	}

	println("Switch statement")
    

	switch {
	case customerHeight >= 150 || customerAge >= 18:
		println("Allowed without Kids")
	case customerHeight >=120 :
		println("Allowed with Kids Rides")
	default:
		println("Sorry Not Allowed")
	
	}

}	