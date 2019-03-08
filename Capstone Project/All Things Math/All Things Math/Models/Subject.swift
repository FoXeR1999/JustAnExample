//
//  SubjectController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import UIKit

struct Subjects {
    
    let serializeJSON = serializeJSONStruct()
    
    var subjects: [String : [SecondarySubject]] =
        ["Algebra" : [], "Arithmetic" : [], "Calculus" : [], "Geometry" : [], "Trigonometry" : [], "Statistics and Probability" : []]
    
    func setUpSubjects(completion: @escaping ((([SecondarySubject]?),([SecondarySubject]?),([SecondarySubject]?),([SecondarySubject]?),([SecondarySubject]?),([SecondarySubject]?)) -> Void)) { // Make a completion that returns arrays for our subjects. //
        
        serializeJSON.getFormulas { (secondarySubjectArray) in
            guard let unwrappedSecondarySubjectArray = secondarySubjectArray else {
                print("Ya done goofed")
                return
            }
            
            var algebraArray: [SecondarySubject] = []
            var arithmeticArray: [SecondarySubject] = []
            var calculusArray: [SecondarySubject] = []
            var geometryArray: [SecondarySubject] = []
            var trigonometryArray: [SecondarySubject] = []
            var statsArray: [SecondarySubject] = []
            
            for value in unwrappedSecondarySubjectArray {
                if value.subjectIdentifier == "Algebra" {
                    
                    algebraArray.append(value)
                    
                } else if value.subjectIdentifier == "Arithmetic" {
                    
                    arithmeticArray.append(value)
                
                } else if value.subjectIdentifier == "Calculus" {
                    
                    calculusArray.append(value)
                
                } else if value.subjectIdentifier == "Geometry" {
                    
                    geometryArray.append(value)
                
                } else if value.subjectIdentifier == "Trigonometry" {
                    
                    trigonometryArray.append(value)
                
                } else if value.subjectIdentifier == "Statistics and Probability" {
                    
                    statsArray.append(value)
                }
            }
            completion((algebraArray),(arithmeticArray),(calculusArray),(geometryArray),(trigonometryArray),(statsArray))
        }
    }
}
