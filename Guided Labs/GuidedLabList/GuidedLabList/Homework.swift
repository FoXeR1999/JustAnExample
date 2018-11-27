//
//  Homework.swift
//  GuidedLabList
//
//  Created by Justin Herzog on 11/26/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

struct Homework: Codable {
    var className: String
    var homework: String
    var dueDate: String
    
    static let ArchiveURL = documentsDirectory.appendingPathComponent("homeworks").appendingPathExtension("plist")
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(homeworks: [Homework]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedHomework = try? propertyListEncoder.encode(homeworks)
        
        try? encodedHomework?.write(to: Homework.ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Homework]? {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedHomeworkData = try? Data(contentsOf: Homework.ArchiveURL), let decodedHomework = try? propertyListDecoder.decode([Homework].self, from: retrievedHomeworkData) {
            return decodedHomework
        } else {
            return []
        }
    }
}
