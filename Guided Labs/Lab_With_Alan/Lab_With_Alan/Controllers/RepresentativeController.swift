//
//  RepresentativeController.swift
//  Lab_With_Alan
//
//  Created by Justin Herzog on 1/14/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData


class RepresentativeController {
    
    static let sharedController = RepresentativeController()
    
    let baseURL = "https://whoismyrepresentative.com/getall_mems.php?&output=json&zip="
    
    var representatives: [Representative] {
        
        let request: NSFetchRequest <Representative> = Representative.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    func searchForReps(zipCode: String, completion: (([Representative]?) -> Void)? = nil) {
        guard let url = URL(string: baseURL + zipCode) else {
            print("Bad Zipcode")
            return
        }
        
        NetworkController.performNetworkRequest(for: url) { (data, error) in
            guard let data = data else { return }
            
            do {
                let jsonObjects = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = jsonObjects as? Dictionary<String, [Dictionary<String, Any>]>,
                    let results = dictionary["results"] {
                    var reps: [Representative] = []
                    for rep in results {
                        if let representative = Representative(dictionary: rep) {
                            reps.append(representative)
                        }
                    }
                    if let completion = completion {
                        completion(reps)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func deleteRep(rep: Representative) {
        CoreDataStack.context.delete(rep)
        saveToPersistentStorage()
    }
    
    func saveRep(rep: Representative) {
        guard let name = rep.name,
        let phoneNumber = rep.phoneNumber,
            let address = rep.address else { return }
        
        for representative in representatives {
            deleteRep(rep: representative)
        }
        
        let myRep = Representative(context: CoreDataStack.context)
        myRep.name = name
        myRep.address = address
        myRep.phoneNumber = phoneNumber
        saveToPersistentStorage()
    }
    
    private func saveToPersistentStorage() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("AHHH")
        }
    }
}
