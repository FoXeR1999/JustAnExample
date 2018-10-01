/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var randomCollection: [Any] = ["string", 7, 18.48, "ghost", 1, 45.32, true, false]

print(randomCollection)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for object in randomCollection {
    if let anInt = object as? Int {
        print("the int value is \(object)")
    } else if let aDouble = object as? Double {
        print("the double value is \(object)")
    } else if let aBool = object as? Bool {
        print("the Bool value is \(object)")
    } else if let aString = object as? String {
        print("the string value is \(object)")
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let randomDictionary: [String: Any] = ["favNumber": 18, "pi": 3.14159263, "justAString": "string", "statementFalse": false]

print(randomDictionary)

/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0.0

for object in randomDictionary.values {
    if let anInt = object as? Int {
        total += Double(anInt)
    } else if let aDouble = object as? Double {
        total += aDouble
    } else if let aString = object as? String {
        total += 1
    } else if let aBool = object as? Bool {
        if aBool == true {
            total += 2.0
        } else if aBool == false {
            total -= 3.0
        }
    }
}

print(total)

/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0

for object in randomDictionary.values {
    if let anInt = object as? Int {
        total2 += Double(anInt)
    } else if let aDouble = object as? Double {
        total2 += aDouble
    } else if let aString = object as? String {
        total2 += Double(aString.count)
    }
}

print(total2)
//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
























