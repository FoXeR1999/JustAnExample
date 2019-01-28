//
//  Cards.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/23/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

extension Cards {
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = CoreDataStack.context) {
        
        guard let image = dictionary["image"] as? String,
            let suit = dictionary["suit"] as? String,
            let value = dictionary["value"] as? String,
            let code = dictionary["code"] as? String else { return nil }
        
        self.init(context: context)
        
        self.image = image
        self.suit = suit
        self.value = value
        self.code = code
    }
}
