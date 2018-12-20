//
//  TheActualAPI.swift
//  RandomUserAPI
//
//  Created by Justin Herzog on 12/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

// have baseURL + searchTerm

import Foundation

let baseURL = URL(string: "https://randomuser.me/api/?results=100&name=")

struct User  {
    
    let gender: String
    ///
    
    
    let firstName: String
    let lastName: String
    ///
    
    
    let age: Int
    ///
    
    
    let thumbnailPicture: String
    let largePicture: String
    /////////////////////////////////////
    
    
    init?(dictionary: [String : AnyObject]) {
        
        guard let gender = dictionary["gender"] as? String else { return nil }
        self.gender = gender
        
        guard let name = dictionary["name"] as? [String: String],
            let firstName = name["first"],
            let lastName = name["last"] else { return nil }
        self.firstName = firstName
        self.lastName = lastName
        
        guard let dob = dictionary["dob"] as? [String: AnyObject],
            let age = dob["age"] as? Int else { return nil }
        self.age = age
        
        guard let picture = dictionary["picture"] as? [String: String],
            let thumbnailPicture = picture["thumbnail"],
            let largePicture = picture["large"] else { return nil }
        self.thumbnailPicture = thumbnailPicture
        self.largePicture = largePicture
    }
    
    
    /////////////////////////////////////
//    enum CodingKeys: String, CodingKey {
//
//        case results = "results"
//   
//    }
//
//    enum ResultsKeys: String, CodingKey {
//        case name = "name"
//
//        case firstName = "first"
//        case lastName = "last"
//        ///
//        case dob = "dob"
//
//        case age = "age"
//        ///
//        case picture = "picture"
//
//        case thumbnailPicture = "thumbnail"
//        case largePicture = "large"
//    }
//    /////////////////////////////////////
//    init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        results = try values.nestedContainer(keyedBy: ResultsKeys.self, forKey: .results)
//
//
//
//        name = try results.decode(Dictionary.self, forKey: CodingKeys.name)
//        dob = try values.decode(Dictionary.self, forKey: CodingKeys.dob)
//        picture = try values.decode(Dictionary.self, forKey: CodingKeys.picture)
//        firstName = try values.decode(String.self, forKey: CodingKeys.firstName)
//        lastName = try values.decode(String.self, forKey: CodingKeys.lastName)
//        age = try values.decode(Int.self, forKey: CodingKeys.age)
//        thumbnailPicture = try values.decode(URL.self, forKey: CodingKeys.thumbnailPicture)
//        largePicture = try values.decode(URL.self, forKey: CodingKeys.largePicture)
//
//    }
    /////////////////////////////////////
   
}
