import Cocoa


// Day 13 - protocols, extensions, and checkpoint 8

// Protocols and Extensions

// MARK: SECTION 1. How to create and use protocols


// To create a new protocol we write protocol followed by the protocol name. This is a new type, so we need to use camel case starting with an uppercase letter.

// Inside the protocol we list all the methods we require in order for this protocol to work the way we expect.

// These methods do not contain any code inside – there are no function bodies provided here. Instead, we’re specifying the method names, parameters, and return types. You can also mark methods as being throwing or mutating if needed.

// Well, now we can design types that work with that protocol. This means creating new structs, classes, or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.

// The protocol doesn’t specify the full range of functionality that must exist, only a bare minimum. This means when you create new types that conform to the protocol you can add all sorts of other properties and methods as needed.

protocol Vehicle {
	var name: String { get }
	var currentPassengers: Int { get set }
	func estimateTime(for distance: Int) -> Int
	func travel(distance: Int)
}

struct Car: Vehicle {
	let name = "Car"
	var currentPassengers = 1
	func estimateTime(for distance: Int) -> Int {
		distance / 50
	}
	func travel(distance: Int) {
		print("I'm driving \(distance)km.")
	}
	func openSunroof() {
		print("It's a nice day.")
	}
}

struct Bicycle: Vehicle {
	let name = "Bicycle"
	var currentPassengers = 1
	func estimateTime(for distance: Int) -> Int {
		distance / 10
	}
	func travel(distance: Int) {
		print("I'm biking \(distance)km.")
	}
}

func commute(distance: Int, using vehicle: Vehicle) {
	if vehicle.estimateTime(for: distance) > 100 {
		print("That's too slow! I'll try a different vehicle.")
	} else {
		vehicle.travel(distance: distance)
	}
}
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
	for vehicle in vehicles {
		let estimate = vehicle.estimateTime(for: distance)
		print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
	}
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)



// MARK: SECTION 2. How to use opaque return types


// Swift provides one really obscure, really complex, but really important feature called opaque return types, which let us remove complexity in our code. Honestly I wouldn’t cover it in a beginners course if it weren’t for one very important fact: you will see it immediately as soon as you create your very first SwiftUI project.

// Important: You don’t need to understand in detail how opaque return types work, only that they exist and do a very specific job. As you’re following along here you might start to wonder why this feature is useful, but trust me: it is important, and it is useful, so try to power through!

func getRandomNumber() -> some Equatable {
	Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
	Bool.random()
}

// Tip: Bool.random() returns either true or false. Unlike random integers and decimals, we don’t need to specify any parameters because there are no customization options.

// So, getRandomNumber() returns a random integer, and getRandomBool() returns a random Boolean.

// Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” The Equatable protocol is what allows us to use ==, like this:

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber()
print(num == num)
print(num)

// MARK: SECTION 3. How to create and use extensions

// Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

// To demonstrate this, I want to introduce you to a useful method on strings, called trimmingCharacters(in:). This removes certain kinds of characters from the start or end of a string, such as alphanumeric letters, decimal digits, or, most commonly, whitespace and new lines.

// Whitespace is the general term of the space character, the tab character, and a variety of other variants on those two. New lines are line breaks in text, which might sound simple but in practice of course there is no single one way of making them, so when we ask to trim new lines it will automatically take care of all the variants for us.

var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// The .whitespacesAndNewlines value comes from Apple’s Foundation API, and actually so does trimmingCharacters(in:) – like I said way back at the beginning of this course, Foundation is really packed with useful code!

extension String {
	func trimmed() -> String {
		self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
}

let trimmedNew = quote.trimmed()


print(trimmedNew)


func trim(_ string: String) -> String {
	string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed2 = trim(quote)

print(trimmed2)



//var lines: [String] {
//	self.components(separatedBy: .newlines)
//}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

//print(lyrics.lines.count)



//struct Book {
//	let title: String
//	let pageCount: Int
//	let readingHours: Int
//
//	init(title: String, pageCount: Int) {
//			self.title = title
//			self.pageCount = pageCount
//			self.readingHours = pageCount / 50
//	}
//}
//extension Book {
//	init(title: String, pageCount: Int) {
//		self.title = title
//		self.pageCount = pageCount
//		self.readingHours = pageCount / 50
//	}
//}
//
//let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)





// MARK: SECTION 4. How to create and use protocol extensions

// Protocols let us define contracts that conforming types must adhere to, and extensions let us add functionality to existing types. But what would happen if we could write extensions on protocols?

// Well, wonder no more because Swift supports exactly this using the aptly named protocol extensions: we can extend a whole protocol to add method implementations, meaning that any types conforming to that protocol get those methods.

extension Collection {
	var isNotEmpty: Bool {
		isEmpty == false
	}
}

let guests = ["Mario", "Luigi", "Princess Peach"]

if guests.isNotEmpty {
	print("Guest count: \(guests.count)")
}


// With that one word change in place, we can now use isNotEmpty on arrays, sets, and dictionaries, as well as any other types that conform to Collection. Believe it or not, that tiny extension exists in thousands of Swift projects because so many other people find it easier to read.

// More importantly, by extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs. This is really powerful, and leads to a technique Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.



protocol Person {
	var name: String { get }
	func sayHello()
}

extension Person {
	func sayHello() {
		print("Hi, I'm \(name)")
	}
}

struct Employee: Person {
	let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


// Swift uses protocol extensions a lot, but honestly you don’t need to understand them in great detail just yet – you can build fantastic apps without ever using a protocol extension. At this point you know they exist and that’s enough!



// MARK: SECTION 5. Summary:

// Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.

// Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.

// Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.

// Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.




// MARK: SECTION 6. Checkpoint 8

// make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

// A property storing how many rooms it has.

// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)

// A property storing the name of the estate agent responsible for selling the building.

// A method for printing the sales summary of the building, describing what it is along with its other properties.



protocol Building {
	var type: String { get }
	var numberOfRooms: Int { get }
	var purchasePrice: Int { get set }
	var agentName: String { get set }
	func saleSummary()
}

extension Building {
	func saleSummary() {
		print("Speak with \(agentName) to purchase this \(type) for $\(purchasePrice)")
	}
}

struct House: Building {
	let type = "house"
	var numberOfRooms: Int
	var purchasePrice: Int
	var agentName: String
}

struct Office: Building {
	let type = "office"
	var numberOfRooms: Int
	var purchasePrice: Int
	var agentName: String
}

let myNewHouse = House(numberOfRooms: 4, purchasePrice: 350_000, agentName: "Lucy Bear")
myNewHouse.saleSummary()

let myNewOffice = Office(numberOfRooms: 10, purchasePrice: 500_000, agentName: "Harley Horse")
myNewOffice.saleSummary()

