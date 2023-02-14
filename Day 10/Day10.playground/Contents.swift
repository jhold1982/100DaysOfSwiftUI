import Cocoa

// Day 10 - structs, computed properties, and property observers

// Structs, part one

// MARK: SECTION 1. How to create your own structs


// Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions.

struct Album {
	let title: String
	let artist: String
	let year: Int
	
	func printSummary() {
		print("\(title) (\(year) by \(artist))")
	}
}

// That creates a new type called Album, with two string constants called title and artist, plus an integer constant called year. I also added a simple function that summarizes the values of our three constants.

// Notice how Album starts with a capital A? That’s the standard in Swift, and we’ve been using it all along – think of String, Int, Bool, Set, and so on. When you’re referring to a data type, we use camel case where the first letter is uppercased, but when you’re referring to something inside the type, such as a variable or function, we use camel case where the first letter is lowercased. Remember, for the most part this is only a convention rather than a rule, but it’s a helpful one to stick with.

// At this point, Album is just like String or Int – we can make them, assign values, copy them, and so on. For example, we could make a couple of albums, then print some of their values and call their functions:

let fearInoculum = Album(title: "Fear Inoculum", artist: "Tool", year: 2019)
print(fearInoculum.title)
fearInoculum.printSummary()


// Notice how we can create a new Album as if we were calling a function – we just need to provide values for each of the constants in the order they were defined.

// As you can see, both red and wings come from the same Album struct, but once we create them they are separate just like creating two strings.

// You can see this in action when we call printSummary() on each struct, because that function refers to title, artist, and year. In both instances the correct values are printed out for each struct: red prints “Red (2012) by Taylor Swift” and wings prints out “Wings (2016) by BTS” – Swift understands that when printSummary() is called on red, it should use the title, artist, and year constants that also belong to red.

// Where things get more interesting is when you want to have values that can change. For example, we could create an Employee struct that can take vacation as needed:

struct Employee {
	let name: String
	var vacationRemaining: Int
	
	mutating func takeVacation(days: Int) {
		if vacationRemaining > days {
			vacationRemaining -= days
			print("I'm going on vacation!")
			print("PTO remaining: \(vacationRemaining)")
		} else {
			print("You have no PTO available.")
		}
	}
}

// However, that won’t actually work – Swift will refuse to build the code.

// You see, if we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant.

// As a result, Swift makes us take an extra step: any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword.

// Now our code will build just fine, but Swift will stop us from calling takeVacation() from constant structs.

var archer = Employee(name: "Archer Sterling", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// But if you change var archer to let archer you’ll find Swift refuses to build your code again – we’re trying to call a mutating function on a constant struct, which isn’t allowed.

// Variables and constants that belong to structs are called properties.

// Functions that belong to structs are called methods.

// When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.

// When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).

// That last one might seem a bit odd at first, because we’re treating our struct like a function and passing in parameters. This is a little bit of what’s called syntactic sugar – Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters. It then automatically treats these two pieces of code as being the same:

var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

// We actually relied on this behavior previously. Way back when I introduced Double for the first time, I explained that you can’t add an Int and a Double and instead need to write code like this:

let a = 1
let b = 2.0
let c = Double(a) + b

// Now you can see what’s really happening here: Swift’s own Double type is implemented as a struct, and has an initializer function that accepts an integer.

// Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.


// MARK: SECTION 2. How to compute property values dynamically

// Structs can have two kinds of property: a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed. This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions.

// As an example, previously we had an Employee struct that could track how many days of vacation remained for that employee. Here’s a simplified version:

struct Employee2 {
	let name: String
	var vacationRemaining: Int
}

var justin = Employee2(name: "JXHOLD", vacationRemaining: 69)
justin.vacationRemaining -= 13
print(justin.vacationRemaining)

// That works as a trivial struct, but we’re losing valuable information – we’re assigning this employee 14 days of vacation then subtracting them as days are taken, but in doing so we’ve lost how many days they were originally granted.

// We could adjust this to use computed property, like so:

struct Employee3 {
	let name: String
	var vacationAllocated = 14
	var vacationTaken = 0
	var vacationRemaining: Int {
		get {
				vacationAllocated - vacationTaken
			}
			set {
				vacationAllocated = vacationTaken + newValue
			}
	}
}

// Now rather than making vacationRemaining something we can assign to directly, it is instead calculated by subtracting how much vacation they have taken from how much vacation they were allotted.

// When we’re reading from vacationRemaining, it looks like a regular stored property:

var oliver = Employee3(name: "Oliver Bruce", vacationAllocated: 14)
oliver.vacationTaken += 4
print(oliver.vacationRemaining)

// This is really powerful stuff: we’re reading what looks like a property, but behind the scenes Swift is running some code to calculate its value every time.

// We can’t write to it, though, because we haven’t told Swift how that should be handled. To fix that, we need to provide both a getter and a setter – fancy names for “code that reads” and “code that writes” respectively.







// MARK: SECTION 3. How to take action when a property changes

// Swift lets us create property observers, which are special pieces of code that run when properties change. These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.

struct Game {
	var score = 0
}

var game1 = Game()
game1.score += 10
print("Score is now \(game1.score)")
game1.score -= 3
print("Score is now \(game1.score)")
game1.score += 1

struct NewGame {
	var score = 0 {
		didSet {
			print("Score is now \(score)")
		}
	}
}

var game2 = NewGame()
game2.score += 10
game2.score -= 3
game2.score += 1




struct App {
	var contacts = [String]() {
		willSet {
			print("Current value is: \(contacts)")
			print("New value will be: \(newValue)")
		}

		didSet {
			print("There are now \(contacts.count) contacts.")
			print("Old value was \(oldValue)")
		}
	}
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")








// MARK: SECTION 4. How to create custom initializers

// Initializers are specialized methods that are designed to prepare a new struct instance to be used. You’ve already seen how Swift silently generates one for us based on the properties we place inside a struct, but you can also create your own as long as you follow one golden rule: all properties must have a value by the time the initializer ends.

struct Player {
	let name: String
	let number: Int
	
	init(name: String) {
			self.name = name
			number = Int.random(in: 1...99)
		}
}

let player = Player(name: "Megan R")
print(player.number)





