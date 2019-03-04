//
//  secondarySubject.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/7/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import UIKit

struct SecondarySubject {
    let subjectIdentifier: String // So we know what subject to put it in from the JSON
    let name: String // The name of the "Lesson"
    let formula: Formula // Have the formula and what the variable's represent
    let proof: Proof? // A good detailed proof
    let exampleProblems: [ExampleProblem?] // Some example problems, both story and normal
    let relatedFormulas: [RelatedFormulas?] // Just a list of related formulas or tricks that will help you do the problem
    let vocabulary: Vocabulary? // Vocabulary of the math terminology used in the problem
    let logic: Logic? // Some math requires pure logic, really no formula... Put that here
    let tricks: Trick? // Cool and helpful tricks that will come in handy when doing the problems
}
