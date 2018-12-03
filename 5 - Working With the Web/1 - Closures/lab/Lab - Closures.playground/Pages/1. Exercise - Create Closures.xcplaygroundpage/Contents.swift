/*:
 ## Exercise - Create Closures
 
 Create a closure assigned to a constant `blankClosure` that has no parameters and no return value.
 */
let blankClosure = { () -> Void in
    
}

/*:
  Create a closure assigned to a constant `fourClosure` that has no parameters and returns an `Int`. The body of the closure should always return the value 4. Call the closure four times.
 */
let fourClosure = { () -> Int in
    return 4
}

var num = 18
if num != 4 {
    num = 4
    print(fourClosure())
}

/*:
 Create a closure assigned to a constant `greeting` that accepts a `name` string argument with no return value. Within the body of the closure, print the argument. Call the closure four times using "Gary", "Jane", "Rick", and "Beth" as arguments.
 */
var names: Array = ["Gary", "Jane", "Rick", "Beth"]

let greeting = { (name: String) -> Void in
    print("Wassup \(name)")
}

for name in names {
    greeting(name)
}


//: page 1 of 3  |  [Next: Exercise - Passing Closures as Arguments and Syntactic Sugar](@next)
