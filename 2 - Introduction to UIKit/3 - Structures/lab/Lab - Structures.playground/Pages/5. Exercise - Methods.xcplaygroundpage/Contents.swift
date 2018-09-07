/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() -> String {
        let titleAndAuthor = title + ", " + author
        let pagesAndPrice = "\(pages) pages, $\(price)"
        return titleAndAuthor + ", " + pagesAndPrice
    }
}

let legend = Book(title: "Legend", author: "Marie Lu", pages: 305, price: 11.06)

let description = legend.description()
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    func like() -> Int {
        return likes + 1
    }
}

let myPost = Post(message: "Two eyes are better than one", likes: 0, numberOfComments: 0)

let like = myPost.like()


//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
