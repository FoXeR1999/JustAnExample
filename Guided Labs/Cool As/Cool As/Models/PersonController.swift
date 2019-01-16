//
//  PersonController.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    static let sharedPersonController = PersonController()
    
    var people: [Person] {
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            print("error requesting Person")
            return []
        }
    }
    
    func savePerson() {
        do {
            print("saved Person")
            try Stack.context.save()
        } catch {
            print("failed to save Person")
        }
    }
    
    func deletePerson(person: Person) {
        Stack.context.delete(person)
        savePerson()
    }
    
    func createPerson(name: String) {
        let _ = Person(name: name)
        savePerson()
    }
    
    
    
    
}
