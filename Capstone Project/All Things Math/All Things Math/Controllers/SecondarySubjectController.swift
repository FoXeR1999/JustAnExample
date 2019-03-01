//
//  SecondarySubjectController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/21/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

func getFormulas(completion: @escaping (([SecondarySubject]?) -> Void)) {
    //    let url = Bundle.main.url(forResource: "AllThingsMath", withExtension: "json")
    var returnedSecondarySubjectArray = [SecondarySubject]()
    
    guard let url = Bundle.main.url(forResource: "AllThingsMath", withExtension: "json"),
        let data = try? Data(contentsOf: url) else {
            print("Failed to get json or bad url")
            return
    }
    do {
        let jsonObjects = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        guard let json = jsonObjects as? Dictionary<String, Any>, // Gets my whole json File
            let secondarySubjectArray = json["SecondarySubjectArray"] as? [Dictionary<String, Any>] else {
                print("Maybe next year")
                return
                
        }
        
        for dict in secondarySubjectArray {
            
            // SETUP EXAMPLE PROBLEMS \\
            var exampleProblemsArray = [ExampleProblem]()
            
            guard let unwrappedExampleProblem = dict["exampleProblem"] as? [[String : Any]] else {
                print("This ain't working")
                return
                
            }
            
            for exampleProblem in unwrappedExampleProblem {
                guard let unwrappedProblemName = exampleProblem["exampleProblemName"] as? String,
                    let unwrappedProblemImage = exampleProblem["exampleProblemImage"] as? String,
                    let unwrappedSteps =   exampleProblem["steps"] as? [String] else { return }
                
                let newExampleProblem = ExampleProblem(
                    exampleProblemName : unwrappedProblemName,
                    exampleProblemImage : unwrappedProblemImage,
                    steps : unwrappedSteps
                )
                
                exampleProblemsArray.append(newExampleProblem)
            }
            // SETUP RELATED FORMULAS \\
            var relatedFormulasArray = [RelatedFormulas]()
            
            guard let unwrappedRelatedFormulas = dict["relatedFormulas"] as? [[String : String]] else { return }
            
            for relatedFormula in unwrappedRelatedFormulas {
                guard let unwrappedFormulaName = relatedFormula["formulaName"],
                    let unwrappedDescription = relatedFormula["description"] else { return }
                
                let newRelatedFormula = RelatedFormulas(
                    formulaName : unwrappedFormulaName,
                    description : unwrappedDescription
                )
                
                relatedFormulasArray.append(newRelatedFormula)
            }
            
            // Unwrap EVERYTHING //////////////////////////////////////////////////////////////////
            guard let unwrappedSubjectIdentifier = dict["subjectIdentifier"] as? String,
                let unwrappedName = dict["name"] as? String,
                // FORMULA \\
                let unwrappedFormula = dict["formula"] as? Dictionary<String, String>,
                let unwrappedFormulaName = unwrappedFormula["formulaName"],
                let unwrappedActualFormula = unwrappedFormula["actualFormula"],
                let unwrappedVariableExplanation = unwrappedFormula["variableExplanation"],
                let unwrappedDescription = unwrappedFormula["description"],
                // PROOF \\
                let unwrappedProof = dict["proof"] as? Dictionary<String, String>,
                let unwrappedProofName = unwrappedProof["proofName"],
                let unwrappedProofDescription = unwrappedProof["proofDescription"],
                let unwrappedProofImage = unwrappedProof["proofImage"],
                // EXAMPLE PROBLEM \\
                // In the code above \\
                // RELATED FORMULAS \\
                // In the code above \\
                // VOCABULARY \\
                let unwrappedVocabulary = dict["vocabulary"] as? Dictionary<String, [String]>,
                let unwrappedInsideVocabulary = unwrappedVocabulary["vocabulary"],
                // LOGIC \\
                let unwrappedLogic = dict["logic"] as? Dictionary<String, [String]>,
                let unwrappedInsideLogic = unwrappedLogic["logic"],
                // TRICKS \\
                let unwrappedTrick = dict["trick"] as? Dictionary<String, [String]>,
                let unwrappedTricks = unwrappedTrick["tricks"] else { print("KUSO"); return }
            ///////////////////////////////////////////////////////////////////////////////////////
            
            let newSecondarySubject = SecondarySubject(
                subjectIdentifier : unwrappedSubjectIdentifier,
                name : unwrappedName,
                formula : Formula(
                    formulaName : unwrappedFormulaName,
                    actualFormula : unwrappedActualFormula,
                    variableExplanation : unwrappedVariableExplanation,
                    description : unwrappedDescription
                ),
                proof : Proof(
                    proofName : unwrappedProofName,
                    proofDescription : unwrappedProofDescription,
                    proofImage : unwrappedProofImage
                ),
                exampleProblems : exampleProblemsArray,
                relatedFormulas : relatedFormulasArray,
                vocabulary : Vocabulary(
                    vocabulary : unwrappedInsideVocabulary
                ),
                logic : Logic(
                    logic : unwrappedInsideLogic
                ),
                tricks : Trick(
                    tricks : unwrappedTricks
                )
            )
            returnedSecondarySubjectArray.append(newSecondarySubject)
        }
    } catch {
        print("Didn't intialize JSON")
    }
    
}

//struct SecondarySubject {
//    let subjectIdentifier: String // So we know what subject to put it in from the JSON
//    let name: String // The name of the "Lesson"
//    let formula: Formula // Have the formula and what the variable's represent
//    let proof: Proof? // A good detailed proof
//    let exampleProblems: [ExampleProblem?] // Some example problems, both story and normal
//    let relatedFormulas: RelatedFormulas? // Just a list of related formulas or tricks that will help you do the problem
//    let vocabulary: Vocabulary? // Vocabulary of the math terminology used in the problem
//    let logic: Logic? // Some math requires pure logic, really no formula... Put that here
//    let tricks: Trick? // Cool and helpful tricks that will come in handy when doing the problems
//}
