import Cocoa

// Day 6 - loops, summary, and checkpoint 3

// Loops

// MARK: SECTION 1. How to use a for loop to repeat work

let osPlatforms = ["macOS", "iOS", "watchOS", "tvOS", "iPadOS"]

for os in osPlatforms {
	print("Swift works great on \(os)")
}

// That loops over all the items in osPlatforms, putting them one by one into os. We haven’t created os elsewhere; it’s created for us as part of the loop and made available only inside the opening and closing braces.


// We call the code inside the braces the loop body

// We call one cycle through the loop body a loop iteration.

// We call os the loop variable. This exists only inside the loop body, and will change to a new value in the next loop iteration.

let platforms = ["macOS", "iOS", "watchOS", "tvOS", "iPadOS"]

for platform in platforms {
	print("I like to code in Swift for \(platform)")
}

// In fact, Xcode is really smart here: if you write for plat it will recognize that there’s an array called platforms, and offer to autocomplete all of for platform in platforms – it recognizes that platforms is plural and suggests the singular name for the loop variable. When you see Xcode’s suggestion appear, press Return to select it.

// Rather than looping over an array (or set, or dictionary – the syntax is the same!), you can also loop over a fixed range of numbers. For example, we could print out the 5 times table from 1 through 12 like this:

for i in 1...12 {
	print("5 x \(i) = \(5 * i)")
}

// I used the loop variable i, which is a common coding convention for “number you’re counting with”. If you’re counting a second number you would use j, and if you’re counting a third you would use k, but if you’re counting a fourth maybe you should pick better variable names.

// The 1...12 part is a range, and means “all integer numbers between 1 and 12, as well as 1 and 12 themselves.” Ranges are their own unique data type in Swift.

// So, when that loop first runs i will be 1, then it will be 2, then 3, etc, all the way up to 12, after which the loop finishes.

// You can also put loops inside loops, called nested loops, like this:

for i in 1...12 {
	print("The \(i) times table.")
	
	for j in 1...12 {
		print(" \(j) x \(i) is \(j * i)")
	}
	print()
}

// There’s now a nested loop: we count from 1 through 12, and for each number inside there we count 1 through 12 again.

// Using print() by itself, with no text or value being passed in, will just start a new line. This helps break up our output so it looks nicer on the screen.



// So, when you see x...y you know it creates a range that starts at whatever number x is, and counts up to and including whatever number y is.

// Swift has a similar-but-different type of range that counts up to but excluding the final number: ..<. This is best seen in code:

for i in 1...5 {
	print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
	print("Counting 1 up to 5: \(i)")
}


// Before we’re done with for loops, there’s one more thing I want to mention: sometimes you want to run some code a certain number of times using a range, but you don’t actually want the loop variable – you don’t want the i or j, because you don’t use it.

// In this situation, you can replace the loop variable with an underscore, like this:

var lyric = "Haters gonna"

for _ in 1...5 {
	lyric += " hate"
}

print(lyric)



let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
	print("\(name) is a secret agent")
}

// Every time the loop goes around, Swift will take one item from the names array, put it into the name constant, then execute the body of our loop – that’s the print() method.

// However, sometimes you don’t actually need the value that is currently being read, which is where the underscore comes in: Swift will recognize you don’t actually need the variable, and won’t make the temporary constant for you.

// Of course, Swift can really see that anyway – it can see whether or not you’re using name inside the loop, so it can do the same job without the underscore. However, using an underscore does something very similar for our brain: we can look at the code and immediately see the loop variable isn’t being used, no matter how many lines of code are inside the loop body.

// So, if you don’t use a loop variable inside the body, Swift will warn you to rewrite it like this:

for _ in names {
	print("[CENSORED] is a secret agent!")
}


// When we think about ranges of values, English is quite confusing. If I say “give me the sales figures up to yesterday” does that mean including yesterday or excluding yesterday? Both are useful in their own right, so Swift gives us a way of representing them both: ..< is the half-open range that specifies “up to but excluding” and ... is the closed range operator that specifies “up to and including”.

// To make the distinction easier when talking, Swift regularly uses very specific language: “1 to 5” means 1, 2, 3, and 4, but “1 through 5” means 1, 2, 3, 4, and 5. If you remember, Swift’s arrays start at index 0, which means an array containing three items have items at indexes 0, 1, and 2 – a perfect use case for the half-open range operator.

// Things get more interesting when you want only part of a range, such as “anything from 0 upwards” or “index 5 to the end of the array.” You see, these are fairly useful in programming, so Swift make them easier to create by letting us specify only part of a range.

// For example, if we had an array of names like this one:

let newNames = ["Piper", "Alex", "Suzanne", "Gloria"]
print(newNames[0])
print(newNames[1...3])
print(newNames[1...])

for _ in 0...3 {
	print("Hip Hip Hooray!")
}

var numbers = [1, 2, 3, 4, 5, 6]
for number in numbers {
	if number % 2 == 0 {
		print(number)
	}
}


for i in 1...8 {
	if i < 3 {
		print("\(i) is a small number")
	}
}





// MARK: SECTION 2. How to use a while loop to repeat work

// Swift has a second kind of loop called while: provide it with a condition, and a while loop will continually execute the loop body until the condition is false.

var countdown = 10

while countdown > 0 {
	print("\(countdown)…")
	countdown -= 1
}

print("Blast off!")

var sixtySeconds = 60

while sixtySeconds > 0 {
	print("Wait a minute! \(sixtySeconds)...")
	sixtySeconds -= 1
}
print("All done!")

let id = Int.random(in: 1...1000)
print(id)

let amount = Double.random(in: 0...1)
print(amount)


// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
	// roll a new dice and print what it was
	roll = Int.random(in: 1...20)
	print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

// Swift gives us for and while loops, and both are commonly used. However, when you’re just learning it can seem odd to have two commonly used ways to make loops – which should you use and why?

// The main difference is that for loops are generally used with finite sequences: we loop through the numbers 1 through 10, or through the items in an array, for example. On the other hand, while loops can loop until any arbitrary condition becomes false, which allows them until we tell them to stop.

// This means we can repeat the same code until…

// …the user asks us to stop
// …a server tell us to stop
// …we’ve found the answer we’re looking for
// …we’ve generated enough data

var counter = 2
while counter < 64 {
	print("\(counter) is a power of 2.")
	counter *= 2
}

var page: Int = 0
while page <= 5 {
	print("I'm reading page \(page)")
	page += 1
}

var pianoLesson = 1
while pianoLesson < 5 {
	print("This is lesson \(pianoLesson)")
	pianoLesson += 1
}

var cats: Int = 0
while cats < 10 {
	cats += 1
	print("I'm getting another cat.")
	if cats == 4 {
		print("Enough cats!")
		cats = 10
	}
}

var itemsSold: Int = 0
while itemsSold < 5000 {
	itemsSold += 100
	if itemsSold % 1000 == 1000 {
		print("\(itemsSold) items sold - a big milestone!")
	}
}

var number: Int = 10
while number > 0 {
	number -= 2
	if number % 2 == 0 {
		print("\(number) is an even number.")
	}
}

var averageScore = 2.5
while averageScore < 15.0 {
	averageScore += 2.5
	print("The average score is \(averageScore)")
}


// MARK: SECTION 3. How to skip loop items with break and continue

// Swift gives us two ways to skip one or more items in a loop: continue skips the current loop iteration, and break skips all remaining iterations. Like while loops these are sometimes used, but in practice much less than you might think.

// Let’s look at them individually, starting with continue. When you’re looping over an array of data, Swift will take out one item from the array and execute the loop body using it. If you call continue inside that loop body, Swift will immediately stop executing the current loop iteration and jump to the next item in the loop, where it will carry on as normal. This is commonly used near the start of loops, where you eliminate loop variables that don’t pass a test of your choosing.

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
	if filename.hasSuffix(".jpg") == false {
		continue
	}
	print("Found picture: \(filename)")
}


// As for break, that exits a loop immediately and skips all remaining iterations. To demonstrate this, we could write some code to calculate 10 common multiples for two numbers:

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
	// if "i" is a multiple of 4 AND if "i" is a multiple of 14...
	if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
		// add "that" number to the "multiples" array
		multiples.append(i)
		// if that arrays count hits 10, stop (break)
		if multiples.count == 10 {
			break
		}
	}
}
print(multiples)


// Swift’s break keyword lets us exit a loop immediately, regardless of what kind of loop we’re talking about. A lot of the time you won’t need this, because you’re looping over items in an array and want to process them all, or because you’re counting from 1 through 10 and want to handle all those values.

// However, sometimes you do want to end your loop prematurely. For example, if you had an array of scores and you want to figure out how many of them the player achieved without getting a 0, you might write this:

let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
	if score == 0 {
		break
	}

	count += 1
}

print("You had \(count) scores before you got 0.")


for name in ["John", "Paul", "George", "Ringo"] {
//	break
	print("Welcome, \(name)")
}

var password = "1"
while true {
	password += "1"
	if password == "11111" {
		print("That's a terrible password.")
	}
	break
}

for i in 1...15 {
	if i % 3 == 0 {
		if i % 5 == 0 {
			print("\(i) is a multiple of both 3 and 5.")
		}
	}
}


// MARK: SECTION 4. Summary: Conditions and loops

// We use if statements to check a condition is true. You can pass in any condition you want, but ultimately it must boil down to a Boolean.

// If you want, you can add an else block, and/or multiple else if blocks to check other conditions. Swift executes these in order.

// You can combine conditions using ||, which means that the whole condition is true if either subcondition is true, or &&, which means the whole condition is true if both subconditions are true.

// If you’re repeating the same kinds of check a lot, you can use a switch statement instead. These must always be exhaustive, which might mean adding a default case.

// If one of your switch cases uses fallthrough, it means Swift will execute the following case afterwards. This is not used commonly.

// The ternary conditional operator lets us check WTF: What, True, False. Although it’s a little hard to read at first, you’ll see this used a lot in SwiftUI.

// for loops let us loop over arrays, sets, dictionaries, and ranges. You can assign items to a loop variable and use it inside the loop, or you can use underscore, _, to ignore the loop variable.

// while loops let us craft custom loops that will continue running until a condition becomes false.

// We can skip some or all loop items using continue or break respectively.


// MARK: Checkpoint 3

// "Fizz Buzz"

for i in 1...100 {
	if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
		print("FizzBuzz")
	} else if i.isMultiple(of: 3) {
		print("Fizz")
	} else if i.isMultiple(of: 5) {
		print("Buzz")
	} else {
		print(i)
	}
}


