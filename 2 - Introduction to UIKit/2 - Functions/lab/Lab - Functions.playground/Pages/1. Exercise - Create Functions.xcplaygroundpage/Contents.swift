/*:
 ## Exercise - Create Functions
 
 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the funtion and observe the printout.
 */
func introduceMyself(firstName: String, hobbies: String) {
    
    print("Your name is \(firstName) and your hobbies are \(hobbies)")
    
}

introduceMyself(firstName: "Justin", hobbies: "Ping-pong")
/*:
 Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = arc4random_uniform(UInt32(5))` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts. Note that the random number generation will not work unless your function is declared after the `import Foundation` statement below. This is because the `arc4random_uniform(_:)` function is declared in the `Foundation` framework.
 */
import Foundation

func magicEightBall() {
    
    let randomNum = arc4random_uniform(UInt32(5))
    
    if randomNum == 0 {
        print("You will be wealthy")
    } else if randomNum == 1 {
        print("You've met a terrible fate, haven't you?")
    } else if randomNum == 2 {
        print("Today is going to be average")
    } else if randomNum == 3 {
        print("That special someone loves to see the twinkle in your eyes")
    } else if randomNum == 4 {
        print("Give it another try")
    }
    
}

magicEightBall()
//: page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
