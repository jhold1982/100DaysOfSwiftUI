import Cocoa

// Day 15 - Summary / Consolidation

// Congratulations! You made it through all the fundamentals of the Swift programming language. Each day was purposefully very short to give you a solid introduction to the topic, but today is different because we’re going to be reviewing almost everything you learned so far.

// Repetition helps us learn things more thoroughly. These fundamentals are really important in all the Swift you’ll write, so it’s worth doubling down to make sure you understand them fully.

// Some concepts only make complete sense when you’ve understood other concepts. Circling back like this will help link together the core Swift concepts in your head.

// You might have missed something. Let’s face it, you’ve just gone through a ton of videos about the most important parts of Swift – are you absolutely sure you remembered all of it?

// You’ll see how far you’ve come. When you read about arrays and loops – things you might have found challenging previously – hopefully you’ll find them easier now, and feel good that you’re making progress.



// MARK: Creating constants and variables

var name = "Ted"
name = "Rebecca"

let user = "Daphne"

print(user)


// MARK: Strings

//let actor = "Tom Cruise"

let actorTom = "Tom Cruise 🏃‍♂️"

let quote = "He tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

var actor = ["Actor1", "Actor2", "Actor3"]
print(actor.count)


print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))


// MARK: Integers
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)


// MARK: Decimals
let newScore = 3.0


// MARK: Booleans
let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()


// MARK: Joining strings
let newName = "Taylor"
let age = 26
let message = "I'm \(name) and I'm \(age) years old."
print(message)

// MARK: Arrays
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")

colors.remove(at: 0)
print(colors.count)

print(colors.contains("Octarine"))


// MARK: Dictionaries
let employee = [
	"name": "Taylor",
	"job": "Singer"
]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])


// MARK: Sets
var numberSet = Set([1, 1, 3, 5, 7])
print(numberSet)


numberSet.insert(10)



// MARK: Enums
enum Weekday {
	case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday



// MARK: Type annotations
var score1: Double = 0


let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var user1: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var albumsNew: [String] = ["Red", "Fearless"]
var user2: [String: String] = ["id": "@twostraws"]



// MARK: Conditions
let age2 = 16

if age2 < 12 {
	print("You can't vote")
} else if age2 < 18 {
	print("You can vote soon.")
} else {
	print("You can vote now.")
}


let temp = 26

if temp > 20 && temp < 30 {
	print("It's a nice day.")
}


// MARK: Switch statements
enum Weather {
	case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
	print("A nice day.")
case .rain:
	print("Pack an umbrella.")
default:
	print("Should be okay.")
}


// MARK: The ternary conditional operator
let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"




// MARK: Loops
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
	print("Swift works on \(os).")
}

for i in 1...12 {
	print("5 x \(i) is \(5 * i)")
}

for i in 1..<13 {
	print("5 x \(i) is \(5 * i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
	lyric += " hate"
}

print(lyric)


var count = 10

while count > 0 {
	print("\(count)…")
	count -= 1
}

print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
	if file.hasSuffix(".jpg") == false {
		continue
	}

	print("Found picture: \(file)")
}


// MARK: Functions
func printTimesTables(number: Int) {
	for i in 1...12 {
		print("\(i) x \(number) is \(i * number)")
	}
}

printTimesTables(number: 5)


func rollDice() -> Int {
	return Int.random(in: 1...6)
}

let result = rollDice()
print(result)




// MARK: Returning multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
	(firstName: "Taylor", lastName: "Swift")
}

//let user = getUser()
//print("Name: \(user.firstName) \(user.lastName)")


let (firstName, _) = getUser()
print("Name: \(firstName)")



// MARK: Customizing parameter labels
func isUppercase(_ string: String) -> Bool {
	string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)



// MARK: Providing default values for parameters
func greet(_ person: String, formal: Bool = false) {
	if formal {
		print("Welcome, \(person)!")
	} else {
		print("Hi, \(person)!")
	}
}


greet("Tim", formal: true)
greet("Taylor")


// MARK: Handling errors in functions
enum PasswordError: Error {
	case short, obvious
}



func checkPassword(_ password: String) throws -> String {
	if password.count < 5 {
		throw PasswordError.short
	}

	if password == "12345" {
		throw PasswordError.obvious
	}

	if password.count < 10 {
		return "OK"
	} else {
		return "Good"
	}
}


let string1 = "12345"

do {
	let result = try checkPassword(string1)
	print("Rating: \(result)")
} catch PasswordError.obvious {
	print("I have the same combination on my luggage!")
} catch {
	print("There was an error.")
}


// MARK: Closures
let sayHello = {
	print("Hi there!")
}

sayHello()

let sayHello1 = { (name: String) -> String in
	"Hi \(name)!"
}

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
	return name.hasPrefix("T")
})



// MARK: Trailing closures and shorthand syntax
let team2 = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT2 = team2.filter({ (name: String) -> Bool in
	return name.hasPrefix("T")
})

print(onlyT2)




// MARK: Structs
struct Album {
	let title: String
	let artist: String
	var isReleased = true

	func printSummary() {
		print("\(title) by \(artist)")
	}
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()




// MARK: Computed properties
struct Employee {
	let name: String
	var vacationAllocated = 14
	var vacationTaken = 0

	var vacationRemaining: Int {
		vacationAllocated - vacationTaken
	}
}



//var vacationRemaining: Int {
//	get {
//		vacationAllocated - vacationTaken
//	}
//
//	set {
//		vacationAllocated = vacationTaken + newValue
//	}
//}



// MARK: Property observers
struct Game {
	var score = 0 {
		didSet {
			print("Score is now \(score)")
		}
	}
}

var game = Game()
game.score += 10
game.score -= 3




// MARK: Custom initializers
struct Player {
	let name: String
	let number: Int

	init(name: String) {
		self.name = name
		number = Int.random(in: 1...99)
	}
}




// MARK: Access control

//  Use private for “don’t let anything outside the struct use this.”

// Use private(set) for “anything outside the struct can read this, but don’t let them change it.”

// Use fileprivate for “don’t let anything outside the current file use this.”

// Use public for “let anyone, anywhere use this.”

struct BankAccount {
	private(set) var funds = 0
	mutating func deposit(amount: Int) {
		funds += amount
	}
	mutating func withdraw(amount: Int) -> Bool {
		if funds > amount {
			funds -= amount
			return true
		} else {
			return false
		}
	}
}

// Because we used private(set), reading funds from outside the struct is fine but writing isn’t possible.



// MARK: Static properties and methods
struct AppData {
	static let version = "1.3 beta 2"
	static let settings = "settings.json"
}




// MARK: Classes
class Employee2 {
	let hours: Int

	init(hours: Int) {
		self.hours = hours
	}

	func printSummary() {
		print("I work \(hours) hours a day.")
	}
}

class Developer: Employee2 {
	func work() {
		print("I'm coding for \(hours) hours.")
	}
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()



class Vehicle {
	let isElectric: Bool

	init(isElectric: Bool) {
		self.isElectric = isElectric
	}
}

class Car: Vehicle {
	let isConvertible: Bool

	init(isElectric: Bool, isConvertible: Bool) {
		self.isConvertible = isConvertible
		super.init(isElectric: isElectric)
	}
}


// super allows us to call up to methods that belong to our parent class, such as its initializer.

class Singer {
	var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)


// The third difference is that all copies of a class instance share their data, meaning that changes you make to one will automatically change other copies.



// MARK: Protocols

// Protocols define functionality we expect a data type to support, and Swift ensures our code follows those rules.

protocol VehicleCar {
	func estimateTime(for distance: Int) -> Int
	func travel(distance: Int)
}

// That lists the required methods for this protocol to work, but doesn’t contain any code – we’re specifying only method names, parameters, and return types.

// Once you have a protocol you can make data types conform to it by implementing the required functionality. For example, we could make a Car struct that conforms to Vehicle:

struct NewCar: VehicleCar {
	func estimateTime(for distance: Int) -> Int {
		distance / 50
	}

	func travel(distance: Int) {
		print("I'm driving \(distance)km.")
	}
}

func commute(distance: Int, using vehicle: VehicleCar) {
	if vehicle.estimateTime(for: distance) > 100 {
		print("Too slow!")
	} else {
		vehicle.travel(distance: distance)
	}
}

let car = NewCar()
commute(distance: 100, using: car)



// MARK: Extensions

// Extensions let us add functionality to any type. For example, Swift’s strings have a method for trimming whitespace and new lines, but it’s quite long so we could turn it into an extension:

extension String {
	func trimmed() -> String {
		self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
}

var quote2 = "   The truth is rarely pure and never simple   "
let trimmed = quote2.trimmed()



// MARK: Protocol extensions

// Protocol extensions extend a whole protocol to add computed properties and method implementations, so any types conforming to that protocol get them.

// For example, Array, Dictionary, and Set all conform to the Collection protocol, so we can add a computed property to all three of them like this:

extension Collection {
	var isNotEmpty: Bool {
		isEmpty == false
	}
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
	print("Guest count: \(guests.count)")
}


// MARK: Optionals

// Optionals represent the absence of data – for example, they distinguish between an integer having the value 0, and having no value at all.

let opposites = [
	"Mario": "Wario",
	"Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]



// MARK: Unwrapping optionals with guard

// Swift has a second way of unwrapping optionals, called guard let, which is very similar to if let except it flips things around: if let runs the code inside its braces if the optional had a value, and guard let runs the code if the optional didn’t have a value.

func printSquareNew(of number: Int?) {
	guard let number = number else {
		print("Missing input")
		return
	}

	print("\(number) x \(number) is \(number * number)")
}

// If you use guard to check a function’s inputs are valid, Swift requires you to use return if the check fails. However, if the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.



// MARK: Nil coalescing

// Swift has a third way of unwrapping optionals, called the nil coalescing operator – it unwraps an optional and provides a default value if the optional was empty:

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"





// MARK: Optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")




// MARK: Optional try?

// When calling a function that might throw errors, we can use try? to convert its result into an optional containing a value on success, or nil otherwise.

enum UserError: Error {
	case badID, networkFailed
}

func getUser(id: Int) throws -> String {
	throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
	print("User: \(user)")
}


// The getUser() function will always throw networkFailed, but we don’t care what was thrown – all we care about is whether the call sent back a user or not.



// MARK: WRAP UP

// We’ve covered the majority of Swift language fundamentals here, but really we’ve only scratched the surface of what the language does. Fortunately, with what you’ve learned you already know enough to build some fantastic software with Swift and SwiftUI.




