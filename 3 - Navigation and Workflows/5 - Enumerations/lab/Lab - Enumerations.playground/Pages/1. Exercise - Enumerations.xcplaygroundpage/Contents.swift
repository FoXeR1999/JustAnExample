/*:
 ## Exercise - Enumerations
 
 Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.
 */
enum Suit {
    case clubs, spade, diamonds, hearts
}

/*:
 Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.
 */
var cardInHand = Suit.hearts
print(cardInHand)

/*:
 Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.
 */
cardInHand = Suit.spade

print(cardInHand)

/*:
 Imagine you are writing an app that will display a fun fortune (i.e. something like "You will soon find what you seek.") based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.
 */
func getFortune(cardSuit: Suit) {
    if cardSuit == Suit.clubs {
        print("That special someone likes the twikle in your eyes.")
    } else if cardSuit == Suit.diamonds {
        print("Someone is waiting for you company.")
    } else if cardSuit == Suit.hearts {
        print("You will soon find great joy in something simple.")
    } else if cardSuit == Suit.spade {
        print("You will soon meet a new acquaintance")
    }
}

getFortune(cardSuit: Suit.clubs)
/*:
 Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.
 */
struct Card {
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    let suit: Suit
    let value: Value
}

/*:
 How many values can playing cards have? How many values can `Int` be? It would be safer to have an enum for the card's value as well. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`. Initialize two `Card` objects and print a statement for each that details the card's value and suit.
 */
let luckyCard = Card(suit: Suit.spade, value: Card.Value.nine)
print(luckyCard.suit)
print(luckyCard.value)
print("\(luckyCard.value) of \(luckyCard.suit)")

let myCard = Card(suit: Suit.hearts, value: Card.Value.three)
print(myCard.suit)
print(myCard.value)
print("\(myCard.value) of \(myCard.suit)")
//: page 1 of 2  |  [Next: App Exercise - Swimming Workouts](@next)
