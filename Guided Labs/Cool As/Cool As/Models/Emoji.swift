//
//  Emoji.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

extension Emoji {
    
    convenience init?(emoji: String, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        self.emoji = emoji
    }
}
