import Cocoa

var name = "Ted"
name = "Rebecca"

let user = "Daphne"

print(user)

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

let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)

let newScore = 3.0

let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()

let newName = "Taylor"
let age = 26
let message = "I'm \(name) and I'm \(age) years old."
print(message)


var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")

colors.remove(at: 0)
print(colors.count)

print(colors.contains("Octarine"))

let employee = [
	"name": "Taylor",
	"job": "Singer"
]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])

var numberSet = Set([1, 1, 3, 5, 7])
print(numberSet)


numberSet.insert(10)


enum Weekday {
	case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday

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


