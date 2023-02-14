import Cocoa

// Day 7 – functions, parameters, and return values

// Functions, part one

// MARK: SECTION 1. How to reuse code with functions

func showWelcome() {
	print("Welcome to my app!")
	print("By default, this prints out a conversion")
	print("chart from centimeters to inches but, ")
	print("you can set a custom range if you want.")
}
showWelcome()

// There’s one extra thing in there, and you might recognize it from our work so far: the () directly after showWelcome. We first met these way back when we looked at strings, when I said that count doesn’t have () after it, but uppercased() does.

// Well, now you’re learning why: those () are used with functions. They are used when you create the function, as you can see above, but also when you call the function – when you ask Swift to run its code. In our case, we can call our function like this:

// That’s known as the function’s call site, which is a fancy name meaning “a place where a function is called.”

// So what do the parentheses actually do? Well, that’s where we add configuration options for our functions – we get to pass in data that customizes the way the function works, so the function becomes more flexible.

// We can make our own functions that are open to configuration, all by putting extra code in between the parentheses when we create our function. This should be given a single integer, such as 8, and calculate the multiplication tables for that from 1 through 12.

func printTimesTables(number: Int) {
	for i in 1...12 {
		print("\(i) x \(number) equals \(i * number)")
	}
}
printTimesTables(number: 5)

// Notice how I’ve placed number: Int inside the parentheses? That’s called a parameter, and it’s our customization point. We’re saying whoever calls this function must pass in an integer here, and Swift will enforce it. Inside the function, number is available to use like any other constant, so it appears inside the print() call.

// As you can see, when printTimesTables() is called, we need to explicitly write number: 5 – we need to write the parameter name as part of the function call. This isn’t common in other languages, but I think it’s really helpful in Swift as a reminder of what each parameter does.

// This naming of parameters becomes even more important when you have multiple parameters. For example, if we wanted to customize how high our multiplication tables went we might make the end of our range be set using a second parameter, like this:

func printMultiplication(number: Int, end: Int) {
	for i in 1...end {
		print("\(i) x \(number) equals \(i * number)")
	}
}
printMultiplication(number: 3, end: 15)

// Now that takes two parameters: an integer called number, and an end point called end. Both of those need to be named specifically when printTablesTable() is run, and I hope you can see now why they are important – imagine if our code was this instead:

// printTimesTables(5, 20)

// Can you remember which number was which? Maybe. But would you remember six months from now? Probably not.

// There the 5 and 20 are arguments: they are the actual values that get sent into the function to work with, used to fill number and end.

// So, we have both parameters and arguments: one is a placeholder the other is an actual value, so if you ever forget which is which just remember Parameter/Placeholder, Argument/Actual Value.

// Does this name distinction matter? Not really: I use “parameter” for both, and I’ve known other people to use “argument” for both, and honestly never once in my career has it caused even the slightest issue. In fact, as you’ll see shortly in Swift the distinction is extra confusing, so it’s just not worth thinking about.

// Important: If you prefer to use “argument” for data being passed in and “parameter” for data being received, that’s down to you, but I really do use “parameter” for both, and will be doing so throughout this book and beyond.

func count(to: Int) {
	for i in 1...to {
		print("I'm counting to: \(i)")
	}
}
count(to: 3)

func check(age: Int) {
	if age >= 18 {
		print("You're an adult.")
	} else {
		print("You're a minor.")
	}
}
check(age: 18)

func calculateWages(people: Int) {
	let total = people * 30_000
	print("The total is \(total)")
}
calculateWages(people: 10)

func square(numbers: [Int]) {
	for number in numbers {
		let squared = number * number
		print("\(number) squared is \(squared).")
	}
}
square(numbers: [2, 3, 4])

func buyCar(price: Int) {
	switch price {
	case 0...20_000:
		print("This seems cheap.")
	case 20_001...50_000:
		print("This seems like a reasonable car.")
	case 50_001...100_000:
		print("This had better be a good car.")
	default:
		print("I think I'll just take the bus.")
	}
}
buyCar(price: 32000)





// MARK: SECTION 2. How to return values from functions

// You’ve seen how to create functions and how to add parameters to them, but functions often also send data back – they perform some computation, then return the result of that work back to the call site.

// Swift has lots of these functions built in, and there are tens of thousands more in Apple’s frameworks. For example, our playground has always had import Cocoa at the very top, and that includes a variety of mathematical functions such as sqrt() for calculating the square root of a number.

// The sqrt() function accepts one parameter, which is the number we want to calculate the square root of, and it will go ahead and do the work then send back the square root.

let root = sqrt(169)
print(root)


func rollDice() -> Int {
	Int.random(in: 1...6)
}
let result = rollDice()
print(result)


// So, that says the function must return an integer, and the actual value is sent back with the return keyword.

// Important: When you say your function will return an Int, Swift will make sure it always returns an Int – you can’t forget to send back a value, because your code won’t build.

// Let’s try a more complex example: do two strings contain the same letters, regardless of their order? This function should accept two string parameters, and return true if their letters are the same – so, “abc” and “cab” should return true because they both contain one “a”, one “b”, and one “c”.

func areLettersTheSame(string1: String, string2: String) -> Bool {
	string1.sorted() == string2.sorted()
}
areLettersTheSame(string1: "abc", string2: "bac")

// It creates a new function called areLettersIdentical().

// The function accepts two string parameters, string1 and string2.

// The function says it returns a Bool, so at some point we must always return either true or false.

// Inside the function body, we sort both strings then use == to compare the strings – if they are the same it will return true, otherwise it will return false.

// That code sorts both string1 and string2, assigning their sorted values to new constants, first and second. However, that isn’t needed – we can skip those temporary constants and just compare the results of sorted() directly, like this:


func areTheseValuesTheSame(value1: Int, value2: Int) -> Bool {
	value1 == value2
}
areTheseValuesTheSame(value1: 420, value2: 420)


// Let’s try a third example. Do you remember the Pythagorean theorem from school? It states that if you have a triangle with one right angle inside, you can calculate the length of the hypotenuse by squaring both its other sides, adding them together, then calculating the square root of the result

// You already learned how to use sqrt(), so we can build a pythagoras() function that accepts two decimal numbers and returns another one:

func pythagoras(a: Double, b: Double) -> Double {
	sqrt(a * a + b * b)
}
let c = pythagoras(a: 3, b: 4)
print(c)


// We use the return keyword to send back values from functions in Swift, but there is one specific case where it isn’t needed: when our function contains only a single expression.


// All this matters because Swift lets us skip using the return keyword when we have only one expression in our function. So, these two functions do the same thing:



func doMath() -> Int {
	return 5 + 5
}

func doMoreMath() -> Int {
	5 + 5
}


func read(books: [String]) -> Bool {
	for book in books {
		print("I'm reading \(book)")
	}
	return true
}
read(books: ["Harry Potter"])

func writeToLog(message: String) -> Bool {
	if message != "" {
		print("Log: \(message)")
		return true
	} else {
		return false
	}
}
writeToLog(message: "Today was a good day.")

func countMultiplesOf10(numbers: [Int]) -> Int {
	var result = 0
	for number in numbers {
		if number % 10 == 0 {
			result += 1
		}
	}
	return result
}
countMultiplesOf10(numbers: [5, 10, 15, 20, 25])




// MARK: SECTION 3. How to return multiple values from functions


// When you want to return a single value from a function, you write an arrow and a data type before your function’s opening brace, like this:

func isUppercase(string: String) -> Bool {
	string == string.uppercased()
}

func isLowercase(string: String) -> Bool {
	string == string.lowercased()
}

// That compares a string against the uppercased version of itself. If the string was already fully uppercased then nothing will have changed and the two strings will be identical, otherwise they will be different and == will send back false.

// If you want to return two or more values from a function, you could use an array. For example, here’s one that sends back a user’s details:

func getUserOld() -> [String] {
	["Taylor", "Swift"]
}

let userOld = getUserOld()
print("Name: \(userOld[0]) \(userOld[1])")

// That’s problematic, because it’s hard to remember what user[0] and user[1] are, and if we ever adjust the data in that array then user[0] and user[1] could end up being something else or perhaps not existing at all.

// Yes, we’ve now given meaningful names to the various parts of our user data, but look at that call to print() – even though we know both firstName and lastName will exist, we still need to provide default values just in case things aren’t what we expect.

// Both of these solutions are pretty bad, but Swift has a solution in the form of tuples. Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into a single variable, but unlike those other options tuples have a fixed size and can have a variety of data types.

// Here’s how our function looks when it returns a tuple:

func getUser() -> (firstName: String, lastName: String) {
	(firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


// Our return type is now (firstName: String, lastName: String), which is a tuple containing two strings.

// Each string in our tuple has a name. These aren’t in quotes: they are specific names for each item in our tuple, as opposed to the kinds of arbitrary keys we had in dictionaries.

// Inside the function we send back a tuple containing all the elements we promised, attached to the names: firstName is being set to “Taylor”, etc.

// When we call getUser(), we can read the tuple’s values using the key names: firstName, lastName, etc.

// When you access values in a dictionary, Swift can’t know ahead of time whether they are present or not. Yes, we knew that user["firstName"] was going to be there, but Swift can’t be sure and so we need to provide a default value.

// When you access values in a tuple, Swift does know ahead of time that it is available because the tuple says it will be available.

// We access values using user.firstName: it’s not a string, so there’s also no chance of typos.

// Our dictionary might contain hundreds of other values alongside "firstName", but our tuple can’t – we must list all the values it will contain, and as a result it’s guaranteed to contain them all and nothing else.

// So, tuples have a key advantage over dictionaries: we specify exactly which values will exist and what types they have, whereas dictionaries may or may not contain the values we’re asking for

// Remember: arrays keep the order and can have duplicates, sets are unordered and can’t have duplicates, and tuples have a fixed number of values of fixed types inside them.

// If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set.

// If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.

// If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.

// If you want to store items for a todo list, that works best when the order is predictable so you should use an array.

// If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.



// MARK: SECTION 4. How to customize parameter labels


func rollThemDice(sides: Int, count: Int) -> [Int] {
	// Start with an empty Array:
	var rolls = [Int]()
	
	// Roll as many dice as needed:
	for _ in 1...count {
		// Add each result to our array:
		let roll = Int.random(in: 1...sides)
		rolls.append(roll)
	}
	// Send back all the results
	return rolls
}
let rolls = rollThemDice(sides: 6, count: 3)
print(rolls)



