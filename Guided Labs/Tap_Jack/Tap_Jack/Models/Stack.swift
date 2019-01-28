//
//  Stack.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/22/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error {
                fatalError("Unknown error \(error)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
