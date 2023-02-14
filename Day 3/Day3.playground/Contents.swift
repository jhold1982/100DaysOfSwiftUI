import Cocoa
import Foundation

// Day 3
// Complex data types, part 1
// MARK: SECTION 1. How to store ordered data in Arrays

var beatles = ["George", "John", "Paul", "Ringo"]
let lostNumbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 37.0]

print(beatles[0])
print(lostNumbers[1])
print(temperatures[2])

beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

let firstBeatle = beatles[0]
let firstNumber = lostNumbers[0]

print(firstBeatle)
print(firstNumber)


// The open and closing parentheses after Array<Int> are there because it’s possible to customize the way the array is created if you need to. For example, you might want to fill the array with lots of temporary data before adding the real stuff later on.
// An Array of <Int> that is initialized ()
var scoresArray = Array<Int>()
scoresArray.append(100)
scoresArray.append(69)
scoresArray.append(420)
scoresArray.append(777)
scoresArray.append(13)
print(scoresArray[1])

// The declaration of the String Array can be written as [String]() instead of Array<String>()
var albumsArray = [String]()
albumsArray.append("Folklore")
albumsArray.append("Fearless")
albumsArray.append("Red")
print(albumsArray)

// Swift’s type safety means that it must always know what type of data an array is storing. That might mean being explicit by saying albums is an Array<String>, but if you provide some initial values Swift can figure it out for itself:
var toolAlbumsArray = ["10,000 Days"]
toolAlbumsArray.append("ÆNIMA")
print(toolAlbumsArray)
toolAlbumsArray.append("Opiate")
toolAlbumsArray.append("Undertow")
toolAlbumsArray.append("Lateralus")
toolAlbumsArray.append("Fear Inoculum")
print(toolAlbumsArray)
// First, you can use .count to read how many items are in an array, just like you did with strings:
print(toolAlbumsArray.count)

// Second, you can remove items from an array by using either remove(at:) to remove one item at a specific index, or removeAll() to remove everything:
var characters = ["Harry", "Ron", "Hermoine"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

// Third, you can check whether an array contains a particular item by using contains(), like this:
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// Fourth, you can sort an array using sorted(), like this:
let texasCities = ["Dallas", "Austin", "Houston", "San Antonio"]
print(texasCities.sorted())

// That returns a new array with its items sorted in ascending order, which means alphabetically for strings but numerically for numbers – the original array remains unchanged.

// Finally, you can reverse an array by calling reversed() on it:

let presidents = ["Trump", "Reagan", "Washington", "Lincoln"]
let presidentsReversed = presidents.reversed()
print(presidentsReversed)
print(presidents.sorted())




// MARK: SECTION 2. How to store and find data in dictionaries

// You’ve seen how arrays are a great way to store data that has a particular order, such as days of the week or temperatures for a city. Arrays are a great choice when items should be stored in the order you add them, or when you might have duplicate items in there, but very often accessing data by its position in the array can be annoying or even dangerous.

// For example, here’s an array containing an employee’s details:

var employeeDetails = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employeeDetails[0])")
print("Job Title: \(employeeDetails[1])")
print("Location: \(employeeDetails[2])")

// But that has a couple of problems. First, you can’t really be sure that employee[2] is their location – maybe that’s their password. Second, there’s no guarantee that item 2 is even there, particularly because we made the array a variable. This kind of code would cause serious problems:

print("Name: \(employeeDetails[0])")
employeeDetails.remove(at: 1)
print("Job title: \(employeeDetails[1])")
// print("Location: \(employeeDetails[2])")

// That now prints Nashville as the job title, which is wrong, and will cause our code to crash when it reads employee[2], which is just bad.

// Swift has a solution for both these problems, called dictionaries. Dictionaries don’t store items according to their position like arrays do, but instead let us decide where items should be stored.

// For example, we could rewrite our previous example to be more explicit about what each item is:

let newEmployeeDetails = [
	"Name": "Taylor Swift",
	"Job Title": "Singer",
	"Location": "Nashville"
]
print(newEmployeeDetails)

// As you can see, we’re now being really clear: the name is Taylor Swift, the job is Singer, and the location is Nashville. Swift calls the strings on the left – name, job, and location – the keys to the dictionary, and the strings on the right are the values.

// When it comes to reading data out from the dictionary, you use the same keys you used when creating it:

print(newEmployeeDetails["Name", default: "Unknown"])
print(newEmployeeDetails["Job Title", default: "Unknown"])
print(newEmployeeDetails["Location", default: "Unknown"])


let hasGraduated = [
	"Eric": false,
	"Maeve": true,
	"Otis": false
]


let olympics = [
	2012: "London",
	2016: "Rio de Janeiro",
	2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

// You can also create an empty dictionary using whatever explicit types you want to store, then set keys one by one:

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

// Notice how we need to write [String: Int] now, to mean a dictionary with strings for its keys and integers for its values.

// Because each dictionary item must exist at one specific key, dictionaries don’t allow duplicate keys to exist. Instead, if you set a value for a key that already exists, Swift will overwrite whatever was the previous value.

// For example, if you were chatting with a friend about superheroes and supervillains, you might store them in a dictionary like this:

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
print(archEnemies["Batman", default: "Unknown"])
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
print(archEnemies["Batman", default: "Unknown"])

// Finally, just like arrays and the other data types we’ve seen so far, dictionaries come with some useful functionality that you’ll want to use in the future – count and removeAll() both exists for dictionaries, and work just like they do for arrays.


let results = [
	"english": 100,
	"french": 85,
	"geography": 75
]
let historyResult = results["history", default: 0]
print(historyResult)

// Xcode returns "0" because there is no dictionary key for "history"



// MARK: SECTION 3. How to use sets for fast data lookup

let actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L. Jackson"])
print(actors)

var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L. Jackson")
print(people)

// Notice how we’re using insert()? When we had an array of strings, we added items by calling append(), but that name doesn’t make sense here – we aren’t adding an item to the end of the set, because the set will store the items in whatever order it wants.

// Both sets and arrays are collections of data, meaning that they hold multiple values inside a single variable.

// However, how they hold their values is what matters: sets are unordered and cannot contain duplicates, whereas arrays retain their order and can contain duplicates.


// MARK: SECTION 4. How to create and use enums

// An enum – short for enumeration – is a set of named values we can create and use in our code. They don’t have any special meaning to Swift, but they are more efficient and safer, so you’ll use them a lot in your code.

enum WeekdayExample1 {
	case monday, tuesday, wednesday, thursday, friday
}

// Swift does two things that make enums a little easier to use. First, when you have many cases in an enum you can just write case once, then separate each case with a comma:

enum WeekdayExample2 {
	case monday
	case tuesday
	case wednesday
	case thursday
	case friday
}
enum WeekendExample1 {
	case saturday, sunday
}
enum WeekendExample2 {
	case saturday
	case sunday
}

var day = WeekdayExample1.monday
day = WeekdayExample1.friday
print(day)

// Second, remember that once you assign a value to a variable or constant, its data type becomes fixed – you can’t set a variable to a string at first, then an integer later on. Well, for enums this means you can skip the enum name after the first assignment, like this:

var newDay = WeekdayExample1.monday
newDay = .tuesday
print(newDay)








