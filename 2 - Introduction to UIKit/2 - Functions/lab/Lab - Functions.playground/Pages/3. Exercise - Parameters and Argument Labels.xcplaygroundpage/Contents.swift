/*:
 ## Exercise - Parameters and Argument Labels
 
 Write a new introduction function called `introduction`. It should take two `String` parameters, `name` and `home`, and one `Int` parameter, `age`. The function should print a brief introduction. I.e. if "Mary," "California," and 32 were passed into the function, it might print "Mary, 32, is from California." Call the function and observe the printout.
 */
func introduction(name: String, home: String, age: Int) {
    print("\(name), \(age), is from \(home)")
}

introduction(name: "Justin", home: "American Fork", age: 17)
/*:
 Write a function called `almostAddition` that takes two `Int` arguments. The first argument should not require an argument label. The function should add the two arguments together, subtract 2, then print the result. Call the function and observe the printout.
 */
func addition(_ firstNumber: Double, plus secondNumber: Double) {
    print(firstNumber + secondNumber)
}

// Ask how to make the addition func not say anything instead of "firstNumber".

// Also ask how to have more than one word, such as "func multiplication(_ firstNumber: Double, multiplied by secondNumber: Double)"

addition(8.5, plus: 2)

addition(5.2, plus: 3.1415926535)

addition(5.4, plus: 2)
/*:
 Write a function called `multiply` that takes two `Double` arguments. The function should multiply the two arguments and print the result. The first argument should not require a label, and the second argument should have an external label, "by", that differs from the internal label. Call the function and observe the printout.
 */
func multiply(_ firstNumber: Double, times secondNumber: Double) {
    print(firstNumber * secondNumber)
}

multiply(3.4, times: 6)
//: [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Progress Updates](@next)
func student(name: String) -> String {
    return name
}
student(name: "Justin")
student(name: "Bryson")



