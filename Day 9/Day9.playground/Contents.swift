import Cocoa

// Day 9 – closures, passing functions into functions, and checkpoint 5

// Closures

// MARK: SECTION 1. How to create and use closures

// Functions are powerful things in Swift. Yes, you’ve seen how you can call them, pass in values, and return data, but you can also assign them to variables, pass functions into functions, and even return functions from functions.



func greetUser() {
	print("Hi there!")
}

greetUser()



//var greetCopy = greetUser
//greetCopy()

// That creates a trivial function and calls it, but then creates a copy of that function and calls the copy. As a result, it will print the same message twice.

// Important: When you’re copying a function, you don’t write the parentheses after it – it’s var greetCopy = greetUser and not var greetCopy = greetUser(). If you put the parentheses there you are calling the function and assigning its return value back to something else.

// But what if you wanted to skip creating a separate function, and just assign the functionality directly to a constant or variable? Well, it turns out you can do that too:

// You're assigning functionality to a constant or variable



let sayHello = {
	print("Hi there!")
}

sayHello()

let deezNuts = {
	print("Deez Nuts!")
}

deezNuts()



// Swift gives this the grandiose name closure expression, which is a fancy way of saying we just created a closure – a chunk of code we can pass around and call whenever we want. This one doesn’t have a name, but otherwise it’s effectively a function that takes no parameters and doesn’t return a value.

// If you want the closure to accept parameters, they need to be written in a special way. You see, the closure starts and ends with the braces, which means we can’t put code outside those braces to control parameters or return value. So, Swift has a neat workaround: we can put that same information inside the braces, like this:



let sayHey = { (name: String) -> String in
	"Hi \(name)"
}

sayHey("Person")



// I added an extra keyword there – did you spot it? It’s the in keyword, and it comes directly after the parameters and return type of the closure. Again, with a regular function the parameters and return type would come outside the braces, but we can’t do that with closures. So, in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself. There’s a reason for this, and you’ll see it for yourself soon enough.

// To get an idea of why closures are so useful, I first want to introduce you to function types. You’ve seen how integers have the type Int, and decimals have the type Double, etc, and now I want you to think about how functions have types too.

// Let’s take the greetUser() function we wrote earlier: it accepts no parameters, returns no value, and does not throw errors. If we were to write that as a type annotation for greetCopy, we’d write this:



var greetCopy: () -> Void = greetUser




// The empty parentheses marks a function that takes no parameters.

// The arrow means just what it means when creating a function: we’re about to declare the return type for the function.

// Void means “nothing” – this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list.

// Every function’s type depends on the data it receives and sends back. That might sound simple, but it hides an important catch: the names of the data it receives are not part of the function’s type.




func getUserData(for id: Int) -> String {
	if id == 1989 {
		return "Taylor Swift"
	} else {
		return "Anonymous"
	}
}
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)



// That starts off easily enough: it’s a function that accepts an integer and returns a string. But when we take a copy of the function the type of function doesn’t include the for external parameter name, so when the copy is called we use data(1989) rather than data(for: 1989).

// Cunningly this same rule applies to all closures – you might have noticed that I didn’t actually use the sayHello closure we wrote earlier, and that’s because I didn’t want to leave you questioning the lack of a parameter name at the call site. Let’s call it now:

// Running some code after a delay.
// Running some code after an animation has finished.
// Running some code when a download has finished.
// Running some code when a user has selected an option from your menu.

// Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
	if name1 == "Suzanne" {
		return true
	} else if name2 == "Suzanne" {
		return false
	}
	return name1 < name2
})
print(captainFirstTeam)



// MARK: SECTION 2. How to use trailing closures and shorthand syntax


// how to make previous code shorter using shorthand syntax

let shortFirstTeam = team.sorted {
	if $0 == "Suzanne" {
		return true
	} else if $1 == "Suzanne" {
		return false
	}
	return $0 < $1
}
print(shortFirstTeam)


// even shorter

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)





// MARK: SECTION 3. How to accept functions as parameters

// lottery number generator lol
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
	var numbers = [Int]()
	for _ in 0..<size {
		let newNumber = generator()
		numbers.append(newNumber)
	}
	return numbers
}
let rolls = makeArray(size: 6) {
	Int.random(in: 1...70)
}
print(rolls)
// i might actually try to play these numbers



// a function that accepts three function parameters that do nothing
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
	print("About to start first job")
	first()
	print("About to start second job")
	second()
	print("About to start third job")
	third()
	print("Done")
}
// how to call that function
doImportantWork {
	print("This is the first job")
} second: {
	print("This is the second job")
} third: {
	print("This is the third job")
}




// MARK: SUMMARY: CLOSURES

// You can copy functions in Swift, and they work the same asthe original except they lose their external parameter names.

// All functions have types, just like other data types. This includes the parameters they receive along with their return type, which might be Void – also known as “nothing”.

// You can create closures directly by assigning to a constant or variable.

// Closures that accept parameters or return a value must declare this inside their braces, followed by the keyword in.

// Functions are able to accept other functions as parameters. They must declare up front exactly what data those functions must use, and Swift will ensure the rules are followed.

// In this situation, instead of passing a dedicated function you can also pass a closure – you can make one directly. Swift allows both approaches to work.

// When passing a closure as a function parameter, you don’t need to explicitly write out the types inside your closure if Swift can figure it out automatically. The same is true for the return value – if Swift can figure it out, you don’t need to specify it.

// If one or more of a function’s final parameters are functions, you can use trailing closure syntax.

// You can also use shorthand parameter names such as $0 and $1, but I would recommend doing that only under some conditions.

// You can make your own functions that accept functions as parameters, although in practice it’s much more important to know how to use them than how to create them.

// Of all the various parts of the Swift language, I’d say closures are the single toughest thing to learn. Not only is the syntax a little hard on your eyes at first, but the very concept of passing a function into a function takes a little time to sink in.

// So, if you’ve read through these chapters and feel like your head is about to explode, that’s great – it means you’re half way to understanding closures!



// MARK: CHECKPOINT 5

// input is:

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// filter out any numbers that are even // example.filter { $0 % 2 != 0 }
let oddNumbers = luckyNumbers.filter { $0 % 2 != 0 }
print(oddNumbers)

// sort the array in ascending order // example.sorted { $0 < $1 }
let ascendingOddNumbers = oddNumbers.sorted { $0 < $1 }
print(ascendingOddNumbers)

// map the array to strings in the format "7 is a lucky number" // example.map
let mappedArray = ascendingOddNumbers.map { "\($0) is a lucky number" }
print(mappedArray)

// print the resulting array, one item per line
func printArray() {
	for number in mappedArray {
		print(number)
	}
}
printArray()


// hackingWithSwift solution:

let luckyNumbersArray = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func isOdd(number: Int) -> Bool {
	number.isMultiple(of: 2) == false
}
func luckyString(_ number: Int) -> String {
	"\(number) is a lucky number"
}
func printValue(_ string: String) {
	print(string)
}

luckyNumbersArray.filter(isOdd).sorted().map(luckyString).forEach(printValue)
// array and then filter, sorted, map, and forEach



