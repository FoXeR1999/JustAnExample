//
//  Stack.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

enum Stack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
            
        }
        
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}

