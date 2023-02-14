import Cocoa
import Foundation

// Day 2: Booleans

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

gameOver.toggle()
print(gameOver)

let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting)

let people = "Haters"
let action = "Hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"
print(luggageCode)

let quote = "Then he tapped a sign that said \"Believe\" and walked away."
print(quote)

var city = "Dallas"
var cityMessage = "Welcome to \(city)"
print(cityMessage)

let name = "Taylor"
var age = 26
let taylorSwiftMessage = "Hello my name is \(name) and I'm \(age) years old."
print(taylorSwiftMessage)

print("5 x 5 = \(5 * 5)")

// Checkpoint 1

let myBritishTemperature = 37.0
let myAmericanTemperature = myBritishTemperature * 9 / 5 + 32
print("My temperature in England is \(myBritishTemperature)°C and in America is \(myAmericanTemperature)°F")





