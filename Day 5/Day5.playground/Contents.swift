import Cocoa

// Day 5 – if, switch, and the ternary operator

// Conditions

// MARK: SECTION 1. How to check a condition is true or false

let someCondition: Bool = true

if someCondition {
	print("Do something")
}


let score = 85

if score > 80 {
	print("Great Job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
	print("Where we're going we don't need roads.")
}

if percentage < 85 {
	print("Sorry, you failed the test.")
}

if age >= 18 {
	print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
	print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
	print("It's \(friendName) vs \(ourName)")
}

// So, if the string inside ourName comes before the string inside friendName when sorted alphabetically, it prints ourName first then friendName, exactly as we wanted.

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
	numbers.remove(at: 0)
}
print(numbers)

let name = "Taylor Swift"

if name != "Anonymous" {
	print("Welcome, \(name)")
}

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
	// Make it equal to "Anonymous"
	username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")


if username.count == 0 {
	username = "Anonymous"
}

if username.isEmpty == true {
	username = "Anonymous"
}

if username.isEmpty {
	username = "Anonymous"
}



// MARK: SECTION 2. How to check multiple conditions

let exampleAge = 16
if exampleAge >= 18 {
	print("You can vote in next election.")
} else {
	print("You can't vote yet.")
}


let a = false
let b = true

if a {
	print("Code to run if a is true")
} else if b {
	print("Code to run if a is false but b is true")
} else {
	print("Code to run if both a and b are false")
}


let temp = 25

if temp > 20 {
	if temp < 30 {
		print("It's a nice day.")
	}
}

if temp > 20 && temp < 30 {
	print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
	print("You can buy the game")
}

if userAge >= 18 || hasParentalConsent {
	print("You can buy the game")
}


enum TransportOption {
	case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
	print("Let's fly!")
} else if transport == .bicycle {
	print("I hope there's a bike path…")
} else if transport == .car {
	print("Time to get stuck in traffic.")
} else {
	print("I'm going to hire a scooter now!")
}



// MARK: SECTION 3. How to use switch statements to check multiple conditions

let section3Score = 9001
if section3Score > 9000 {
	print("It's over 9000!")
}

if section3Score > 9000 {
	print("It's over 9000!")
}

if section3Score <= 9000 {
	print("It's not over 9000!")
}

if section3Score > 9000 {
	print("It's over 9000!")
} else {
	print("It's not over 9000!")
}

if section3Score > 9000 {
	print("It's over 9000!")
} else {
	if section3Score == 9000 {
		print("It's exactly 9000!")
	} else {
		print("It's not over 9000!")
	}
}

if section3Score > 9000 {
	print("It's over 9000!")
} else if section3Score == 9000 {
	print("It's exactly 9000!")
} else {
	print("It's not over 9000!")
}

// You can have as many else if checks as you want, but you need exactly one if and either zero or one else.

enum Weather {
	case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
	print("It should be a nice day outside.")
case .rain:
	print("Better pack an umbrella.")
case .wind:
	print("Wear something warm.")
case .snow:
	print("School is cancelled.")
case .unknown:
	print("Our weather machine is broken.")
}

// "Switch" is exhaustive. You must check against all possible cases

let place = "Metropolis"

switch place {
case "Gotham":
	print("You're Batman")
case "Mega City One":
	print("You're Judge Dredd")
case "Wakanda":
	print("You're Black Panther")
default:
	print("Who are you?")
}

// "default:" is added at the end of this switch statement to be the "catch-all if this thing doesn't exist" statement

// "Fall Through" is rarely used but here is an example of where it can save you from repeating work

let day = 5
print("My true love gave to me...")

switch day {
case 5:
	print("5 Golden Rings")
	fallthrough
case 4:
	print("4 calling birds")
	fallthrough
case 3:
	print("3 french hens")
	fallthrough
case 2:
	print("2 turtle doves")
	fallthrough
default:
	print("A partridge in a pear tree.")
}



// MARK: SECTION 4. How to use the ternary conditional operator for quick tests

let currentAge = 18
let canVote = currentAge >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon")

let crewNames = ["Justin", "Lindsay", "Oliver"]
let crewCount = crewNames.isEmpty ? "No one" : "\(crewNames.count) people."
print(crewCount)

enum Theme {
	case light, dark
}
let theme = Theme.dark
let backgroundTheme = theme == .dark ? "Black" : "White"
print(backgroundTheme)

let userIsAuthenticated = true
print(userIsAuthenticated ? "Welcome!" : "Who are you?")

// will this code print "Success!" ???

let phone = "iPhone"
print(phone == "Android" ? "Failure" : "Success")

// Yes, because "phone" is equal to "iPhone"
// let phone equal the string "iPhone",
// and then print(if phone is equal to "Android", print "Failure", otherwise :, print "Success!")


