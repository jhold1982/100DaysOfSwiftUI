import Cocoa
import Foundation

// 100DaysOfSwiftUI - Day 1

var greeting = "Hello, playground"

//var name = "Ted"
//print(name)
//name = "Rebecca"
//print(name)
//name = "Keeley"
//print(name)

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

let actor = "Denzel Washington"

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""
print(actor.count)
let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

let score = 10

let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter += 5
print(counter)

counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

//let number = 120
//print(number.isMultiple(of: 3))
//
//print(120.isMultiple(of: 3))

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
//let c = a + Int(b)
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name = "Nicolas Cage"
name = "John Travolta"

var rating = 5.0
rating *= 2
