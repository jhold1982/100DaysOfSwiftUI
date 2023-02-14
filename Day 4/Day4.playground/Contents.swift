import Cocoa

// Day 4 – type annotations and checkpoint 2

// Complex data types, part 2

// MARK: Section 1. How to use type annotations

// Swift is able to figure out what type of data a constant or variable holds based on what we assign to it. However, sometimes we don’t want to assign a value immediately, or sometimes we want to override Swift’s choice of type, and that’s where type annotations come in.

// So far we’ve been making constants and variables like this:

// let surname = "Lasso"
// var score = 0

// This uses type inference: Swift infers that surname is a string because we’re assigning text to it, and then infers that score is an integer because we’re assigning a whole number to it.

// Type annotations let us be explicit about what data types we want, and look like this:

let surname: String = "Lasso"
var score: Int = 0

// Now we’re being explicit: surname must be a string, and score must be an integer. That’s exactly what Swift’s type inference would have done anyway, but sometimes it isn’t – sometimes you will want to choose a different type.

// For example, maybe score is a decimal because the user can get half points, so you’d write this:

var scoreDouble: Double = 0

// Without the : Double part Swift would infer that to be an integer, but we’re overriding that and saying it’s definitely a decimal number.



// We’ve looked at a few types of data so far, and it’s important you know their names so you can use the right type annotation when needed.


// String holds text:
let playerName: String = "Roy"

// Int holds whole numbers:
var luckyNumber: Int = 13

// Double holds decimal numbers:
let pi: Double = 3.14

// Bool holds either true or false:
var isAuthenticated: Bool = true

// Array holds lots of different values, all in the order you add them. This must be specialized, such as [String]:
var albums: [String] = ["Red", "Fearless"]

// Dictionary holds lots of different values, where you get to decide how data should be accessed. This must be specialized, such as [String: Int]:
var user: [String: String] = ["id": "@leftHandedApps"]

// Set holds lots of different values, but stores them in an order that’s optimized for checking what it contains. This must be specialized, such as Set<String>:
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// Knowing all these types is important for times when you don’t want to provide initial values. For example, this creates an array of strings:
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]


// Type annotation isn’t needed there, because Swift can see you’re assigning an array of strings. However, if you wanted to create an empty array of strings, you’d need to know the type:
var teams: [String] = [String]()


// Some people prefer to use type annotation, then assign an empty array to it like this:
var cities: [String] = []

// I prefer to use type inference as much as possible, so I’d write this:
var clues = [String]()


// Values of an enum have the same type as the enum itself, so we could write something like this:

enum UIStyle {
	case light, dark, system
}
var style = UIStyle.light

// This is what allows Swift to remove the enum name for future assignments, so we can write style = .dark – it knows any new value for style must be some kind UIStyle


let myBritishTemp: Double = 37
let myAmericanTemp: Double = myBritishTemp * 9 / 5 + 32
print("My temp in Celsius is \(myBritishTemp) and in Fahrenheit is \(myAmericanTemp)")



// Checkpoint 2


var myGuitars = ["Fender Strat", "Fender Strat", "Breedlove Acoustic", "Sully Starling", "Sully Protodust", "Sully Raven"]
print(myGuitars.count)
myGuitars.append("Ernie Ball Bass")
print(myGuitars.count)
let guitarSet = Set(myGuitars)
print(guitarSet.count)




