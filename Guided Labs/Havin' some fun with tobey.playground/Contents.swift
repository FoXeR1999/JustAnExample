import UIKit

/*
 let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 let archive URL = documentsDirectory.appendingPathComponent, "AppData"
 
 */



enum StuffingType: String, Codable {
    case cornbread = "Mamma's Cornbread", cranberry, glutenFree, grandmas
}

struct Stuffing: Codable {
    var type: StuffingType
    var person: String
}

enum BreadType: String, Codable {
    case dinnerRolls, hawaiianRolls, cornBread
}

struct Bread: Codable {
    var type: BreadType
    var person: String
}

enum TurkeyType: String, Codable {
    case deepFried, baked, slowCooked, stew, rotisserie, sousVide
}

struct Turkey: Codable {
    var preparationType: TurkeyType
    var person: String
}

enum DessertType: String, Codable {
    case cobbler, pie, iceCream
}

struct Dessert: Codable {
    var type: DessertType
    var person: String
}

struct ThanksgivingFeast: Codable {
    var stuffing: Stuffing
    var bread: Bread
    var turkey: Turkey
    var dessert: Dessert
}

let feast = ThanksgivingFeast(stuffing: Stuffing(type: .cornbread, person: "Doug"), bread: Bread(type: .hawaiianRolls, person: "Joe"), turkey: Turkey(preparationType: .sousVide, person: "Toby"), dessert: Dessert(type: .cobbler, person: "Makay"))

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(documentsDirectory)
let fileURL = documentsDirectory.appendingPathComponent("thanksgivingFeast").appendingPathExtension("plist")


let propertyListEncoder = PropertyListEncoder()
let encodedData = try? propertyListEncoder.encode(feast)

try? encodedData?.write(to: fileURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()

if let retrievedData = try? Data(contentsOf: fileURL) {
let decodedFeast = try? propertyListDecoder.decode(ThanksgivingFeast.self, from: retrievedData)
}
