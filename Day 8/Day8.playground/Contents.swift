import Cocoa

// Day 8 - default values, throwing functions, and checkpoint 4

// Functions, part 2

// MARK: SECTION 1. How to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
	for i in 1...end {
		print("\(i) x \(number) is \(i * number)")
	}
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// This is accomplished using a default parameter value: keepingCapacity is a Boolean with the default value of false so that it does the sensible thing by default, while also leaving open the option of us passing in true for times we want to keep the array’s existing capacity.


// When to use default parameters for functions

// Default parameters let us make functions easier to call by letting us provide common defaults for parameters. So, when we want to call that function using those default values we can just ignore the parameters entirely – as if they didn’t exist – and our function will just do the right thing. Of course, when we want something custom it’s there for us to change.

// Swift developers use default parameters very commonly, because they let us focus on the important parts that do need to change regularly. This can really help simplify complex function, and make your code easier to write.

// For example, imagine some route finding code such as this:

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
	// code here
}


// That assumes that most of the time folks want to drive between two locations by the fastest route, without avoiding highways – sensible defaults that are likely to work most of the time, while giving us the scope to provide custom values when needed.

// As a result, we can call that same function in any of three ways:


findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)


// Shorter, simpler code most of the time, but flexibility when we need it – perfect.


func calculateWages(payBand: Int, isOvertime: Bool = false) -> Int {
	var pay = 10_000 * payBand
	if isOvertime {
		pay *= 2
	}
	return pay
}
calculateWages(payBand: 5, isOvertime: true)



func playGame(name: String, cheat: Bool = false) {
	if cheat {
		print("Let's play \(name); I bet I win!")
	} else {
		print("Let's play \(name)!")
	}
}
playGame(name: "Starfield")



func packLunchbox(number: Int, healthy: Bool = true) {
	for _ in 0..<number {
		if healthy {
			print("I'm packing a healthy lunchbox.")
		} else {
			print("Pizza for everyone!")
		}
	}
}
packLunchbox(number: 3, healthy: false)



func runRace(distance: Int = 10) {
	if distance < 5 {
		print("This should be easy!")
	} else if distance < 10 {
		print("This should be a nice challenge.")
	} else {
		print("Let's do this!")
	}
}
runRace(distance: 11)



func scoreGoal(overheadKick: Bool = false) {
	if overheadKick {
		print("Wow - amazing!")
	} else {
		print("Great goal!")
	}
}
scoreGoal(overheadKick: true)



func goToWarp(speed: Int) {
	if speed > 9 {
		print("The engines cannae take any more!")
	} else {
		print("Going to warp \(speed)...")
	}
}
goToWarp(speed: 10)


func parkCar(_ type: String, automatically: Bool = true) {
	if automatically {
		print("Nice - my \(type) parked itself!")
	} else {
		print("I guess I'll have to do it.")
	}
}
parkCar("Tesla")





// MARK: SECTION 2. How to handle errors in functions

enum PasswordError: Error {
	case short
	case obvious
}
func checkPassword(_ password: String) throws -> String {
	if password.count > 5 {
		throw PasswordError.short
	}
	if password == "12345" {
		throw PasswordError.obvious
	}
	if password.count > 8 {
		return "OK"
	} else if password.count > 10 {
		return "GOOD"
	} else {
		return "Excellent"
	}
}

// do, try, catch

let string = "12345"

do {
	let result = try checkPassword(string)
	print("Password rating: \(result)")
} catch PasswordError.short {
	 print("Please try a longer password.")
} catch PasswordError.obvious {
	print("I have the same combination on my luggage!")
} catch {
	print("There was an error: \(error.localizedDescription)")
}


enum PrintError: Error {
	case invalidCount
}
func printPages(text: String, count: Int) throws {
	if count <= 0 {
		throw PrintError.invalidCount
	} else {
		for _ in 1...count {
			print("Printing \(text)...")
		}
	}
}
try? printPages(text: "Eat Pussy", count: 13)

enum CatProblems: Error {
	case notACat
	case unfriendly
}
func strokeCat(_ name: String) throws {
	if name == "Mr Bitey" {
		throw CatProblems.unfriendly
	} else if name == "Lassie" {
		throw CatProblems.notACat
	} else {
		print("You stroked \(name).")
	}
}




// MARK: SUMMARY

// Functions let us reuse code easily by carving off chunks of code and giving it a name.

// All functions start with the word func, followed by the function’s name. The function’s body is contained inside opening and closing braces.

// We can add parameters to make our functions more flexible – list them out one by one separated by commas: the name of the parameter, then a colon, then the type of the parameter.

// You can control how those parameter names are used externally, either by using a custom external parameter name or by using an underscore to disable the external name for that parameter.

// If you think there are certain parameter values you’ll use repeatedly, you can make them have a default value so your function takes less code to write and does the smart thing by default.

// Functions can return a value if you want, but if you want to return multiple pieces of data from a function you should use a tuple. These hold several named elements, but it’s limited in a way a dictionary is not – you list each element specifically, along with its type.

// Functions can throw errors: you create an enum defining the errors you want to happen, throw those errors inside the function as needed, then use do, try, and catch to handle them at the call site.


// MARK: CHECKPOINT 4


// The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

// You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.

// If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.

// You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.

// If you can’t find the square root, throw a “no root” error.

// As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

enum CheckpointFourError: Error {
	// enum called "whatever" that conforms to Error protocol
	// has three cases to handle possible errors
	case tooLow, tooHigh, notFound
}
func checkpointFour(of number: Int) throws -> Int {
	// function that takes a number of type Int, throws errors, and returns an Int
	// if "number" is less than 1, throw error from enum
	if number < 1 {
		throw CheckpointFourError.tooLow
	}
	// if "number" is greather than 10,000, throw error
	if number > 10_000 {
		throw CheckpointFourError.tooHigh
	}
	// loop over all numbers that can be square roots, number * number = "number" (sq rt of 25 is 5) (5x5=25), (100x100=10,000)
	for i in 1...100 {
		if i * i == number {
			return i
		}
	}
	// after the loop, throw not found error if no sq rt found
	throw CheckpointFourError.notFound
}
// designate a number to test function with
let number = 900
// do, try, catch
do {
	// define root with try the function
	let root = try checkpointFour(of: number)
	print("The square root of \(number) is \(root)")
} catch CheckpointFourError.tooLow {
	print("That number is too low.")
} catch CheckpointFourError.tooHigh {
	print("That number is too high.")
} catch CheckpointFourError.notFound {
	print("There was no square root found for that number.")
} catch {
	print("There was an error: \(error.localizedDescription)")
}


