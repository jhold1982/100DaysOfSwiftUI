import Cocoa

// Day 14 - optionals, nil coalescing, and checkpoint 9

// MARK: SECTION 1. How to handle missing data with optionals

// Swift likes to be predictable, which means as much as possible it encourages us to write code that is safe and will work the way we expect. You’ve already met throwing functions, but Swift has another important way of ensuring predictability called optionals – a word meaning “this thing might have a value or might not.”

let opposites = [
	"Mario": "Wario",
	"Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

// There we create a [String: String] dictionary with two keys: Mario and Luigi. We then attempt to read the value attached to the key “Peach”, which doesn’t exist, and we haven’t provided a default value to send back in place of missing data.

// What will peachOpposite be after that code runs? This is a [String: String] dictionary, which means the keys are strings and the values are strings, but we just tried to read a key that doesn’t exist – it wouldn’t make sense to get a string back if there isn’t a value there.

// Swift gives us two primary ways of unwrapping optionals, but the one you’ll see the most looks like this:

if let marioOpposite = opposites["Mario"] {
	print("Mario's opposite is \(marioOpposite)")
}

// The condition’s body will only be run if the optional had a value inside. Of course, if you want to add an else block you can – it’s just a normal condition, so this kind of code is fine:

var username: String? = nil

if let unwrappedName = username {
	print("We got a user: \(unwrappedName)")
} else {
	print("The optional was empty.")
}

if let unwrappedNumber = number {
	print(square(number: unwrappedNumber))
}

func square(number: Int) -> Int {
	number * number
}

var number: Int? = nil
print(square(number: number ?? 1))


var string1 = "Hello"

var string2 = ""

var string3: String? = nil




// MARK: SECTION 2. How to unwrap options with guard

// You’ve already seen how Swift uses if let to unwrap optionals, and it’s the most common way of using optionals. But there is a second way that does much the same thing, and it’s almost as common: guard let.


func printSquare(of number: Int?) {
	guard let number = number else {
		print("Missing input")

		// 1: We *must* exit the function here
		return
	}

	// 2: `number` is still available outside of `guard`
	print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3

if myVar != nil {
	print("Run if myVar has a value inside")
}

//guard let unwrapped = myVar else {
//	print("Run if myVar doesn't have a value inside")
//}






// MARK: SECTION 3. How to unwrap optionals with nil coalescing

let captains = [
	"Enterprise": "Picard",
	"Voyager": "Janeway",
	"Defiant": "Sisko"
]

let new = captains["Serenity", default: "N/A"]


// Wait… Swift has a third way of unwrapping optionals? Yep! And it’s really useful, too: it’s called the nil coalescing operator and it lets us unwrap an optional and provide a default value if the optional was empty.

// That reads a non-existent key in our captains dictionary, which means new will be an optional string to set to nil.

// With the nil coalescing operator, written ??, we can provide a default value for any optional, like this:


// That will read the value from the captains dictionary and attempt to unwrap it. If the optional has a value inside it will be sent back and stored in new, but if it doesn’t then “N/A” will be used instead.

// This means no matter what the optional contains – a value or nil – the end result is that new will be a real string, not an optional one. That might be the string from inside the captains value, or it might be “N/A”.

// Now, I know what you’re thinking: can’t we just specify a default value when reading from the dictionary? If you’re thinking that you’re absolutely correct:


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"



struct Book {
	let title: String
	let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


// It’s even useful if you create an integer from a string, where you actually get back an optional Int? because the conversion might have failed – you might have provided an invalid integer, such as “Hello”. Here we can use nil coalescing to provide a default value, like this:

let input = ""
let number2 = Int(input) ?? 0
print(number2)







// MARK: SECTION 4. How to handle multiple optionals using optional chaining

// Optional chaining is a simplified syntax for reading optionals inside optionals. That might sound like something you’d want to use rarely, but if I show you an example you’ll see why it’s helpful.

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

//  That uses two optional features at once: you’ve already seen how the nil coalescing operator helps provide a default value if an optional is empty, but before that you see optional chaining where we have a question mark followed by more code.

// Optional chaining allows us to say “if the optional has a value inside, unwrap it then…” and we can add more code. In our case we’re saying “if we managed to get a random element from the array, then uppercase it.” Remember, randomElement() returns an optional because the array might be empty.

// The magic of optional chaining is that it silently does nothing if the optional was empty – it will just send back the same optional you had before, still empty. This means the return value of an optional chain is always an optional, which is why we still need nil coalescing to provide a default value.

// Optional chains can go as long as you want, and as soon as any part sends back nil the rest of the line of code is ignored and sends back nil.

//  To give you an example that pushes optional chaining harder, imagine this: we want to place books in alphabetical order based on their author names. If we break this right down, then:

struct Book2 {
	let title: String
	let author2: String?
}

var book2: Book2? = nil
let author2 = book2?.author2?.first?.uppercased() ?? "A"
print(author2)






// MARK: SECTION 5. How to handle function failure with optionals


// When we call a function that might throw errors, we either call it using try and handle errors appropriately, or if we’re certain the function will not fail we use try! and accept that if we were wrong our code will crash. (Spoiler: you should use try! very rarely.)

// However, there is an alternative: if all we care about is whether the function succeeded or failed, we can use an optional try to have the function return an optional value. If the function ran without throwing any errors then the optional will contain the return value, but if any error was thrown the function will return nil. This means we don’t get to know exactly what error was thrown, but often that’s fine – we might just care if the function worked or not.

enum UserError: Error {
	case badID, networkFailed
}

func getUser(id: Int) throws -> String {
	throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
	print("User: \(user)")
}

// The getUser() function will always throw a networkFailed error, which is fine for our testing purposes, but we don’t actually care what error was thrown – all we care about is whether the call sent back a user or not.

// This is where try? helps: it makes getUser() return an optional string, which will be nil if any errors are thrown. If you want to know exactly what error happened then this approach won’t be useful, but a lot of the time we just don’t care.

// If you want, you can combine try? with nil coalescing, which means “attempt to get the return value from this function, but if it fails use this default value instead.”

// Be careful, though: you need to add some parentheses before nil coalescing so that Swift understands exactly what you mean. For example, you’d write this:

let user3 = (try? getUser(id: 23)) ?? "Anonymous"
print(user3)





// MARK: SECTION 6. SUMMARY - OPTIONALS

// Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.

// As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.

// Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.

// We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.

// The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.

// Optional chaining lets us read an optional inside another optional with a convenient syntax.

// If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.

// Optionals are second only to closures when it comes to language features folks struggle to learn, but I promise after a few months you’ll wonder how you could live without them!








// MARK: SECTION 7. CHECKPOING 9

// Now that you understand a little about optionals, it’s time to pause for a few minutes and try a small coding challenge so you can see how much you’ve remembered.

// Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

// If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.


func getNumber(in array: [Int]?) -> Int {
	let random = Int.random(in: 1...100)
	return (array?.randomElement() ?? random) ?? random
}
