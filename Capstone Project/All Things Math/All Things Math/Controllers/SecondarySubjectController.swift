//
//  SecondarySubjectController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/21/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

func getFormulas(completion: @escaping (([SecondarySubject]?) -> Void)) {
    var loopCounter: Int = 0
    
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
                print("Failed to access SecondarySubjectArray")
                return
                
        }
        
        for dict in secondarySubjectArray {
            loopCounter += 1
            print(loopCounter)
            guard let unwrappedSecondarySubject = dict["SecondarySubject"] as? [String : Any] else { return }
            
            // SETUP EXAMPLE PROBLEMS \\
            var exampleProblemsArray = [ExampleProblem]()
            
            if unwrappedSecondarySubject.keys.contains("exampleProblem") {
                guard let unwrappedExampleProblem = unwrappedSecondarySubject["exampleProblem"] as? [[String : Any]] else {
                    print("Failed to unwrap Example Problem")
                    return
                }
                
                for exampleProblem in unwrappedExampleProblem {
                    var outsideProblemImage: String = ""
                    var outsideProblemName: String = ""
                    var outsideSteps: [String] = []
                    
                    if exampleProblem.keys.contains("exampleProblemImage") {
                        guard let unwrappedProblemImage = exampleProblem["exampleProblemImage"] as? String else { return }
                        outsideProblemImage = unwrappedProblemImage
                    }
                    if exampleProblem.keys.contains("exampleProblemName") {
                        guard let unwrappedProblemName = exampleProblem["exampleProblemName"] as? String else { return }
                        outsideProblemName = unwrappedProblemName
                    }
                    if exampleProblem.keys.contains("steps") {
                        guard let unwrappedSteps = exampleProblem["steps"] as? [String] else { return }
                        outsideSteps = unwrappedSteps
                    }
                    let newExampleProblem = ExampleProblem(
                        exampleProblemName : outsideProblemName,
                        exampleProblemImage : outsideProblemImage,
                        steps : outsideSteps
                    )
                    exampleProblemsArray.append(newExampleProblem)
                }
            }
            
            // SETUP RELATED FORMULAS \\
            var relatedFormulasArray = [RelatedFormulas]()
            
            if unwrappedSecondarySubject.keys.contains("relatedFormulas") {
                guard let unwrappedRelatedFormulas = unwrappedSecondarySubject["relatedFormulas"] as? [[String : String]] else {
                    print("Failed to get unwrappedRelatedFormulas")
                    return
                }
                
                for relatedFormula in unwrappedRelatedFormulas {
                    var outsideFormulaName: String = ""
                    var outsideDescription: String = ""
                    
                    if relatedFormula.keys.contains("formulaName") {
                        guard let unwrappedFormulaName = relatedFormula["formulaName"] else { return }
                        outsideFormulaName = unwrappedFormulaName
                    }
                    if relatedFormula.keys.contains("description") {
                        guard let unwrappedDescription = relatedFormula["description"] else { return }
                        outsideDescription = unwrappedDescription
                    }
                    
                    let newRelatedFormula = RelatedFormulas(
                        formulaName : outsideFormulaName,
                        description : outsideDescription
                    )
                    relatedFormulasArray.append(newRelatedFormula)
                }
            }
            
            // Unwrap EVERYTHING //////////////////////////////////////////////////////////////////
            guard let unwrappedSubjectIdentifier = unwrappedSecondarySubject["subjectIdentifier"] as? String,
                let unwrappedName = unwrappedSecondarySubject["name"] as? String,
                // FORMULA \\
                let unwrappedFormula = unwrappedSecondarySubject["formula"] as? Dictionary<String, String>,
                let unwrappedFormulaName = unwrappedFormula["formulaName"],
                let unwrappedActualFormula = unwrappedFormula["actualFormula"],
                let unwrappedVariableExplanation = unwrappedFormula["variableExplanation"],
                let unwrappedDescription = unwrappedFormula["description"] else {
                    print("Faild to get subjectIdentifier, Name, or Formula.")
                    return
            }
            // PROOF \\
            var outsideProofName: String = ""
            var outsideProofDescription: String = ""
            var outsideProofImage: String = ""
            
            if unwrappedSecondarySubject.keys.contains("proof") {
                guard let unwrappedProof = unwrappedSecondarySubject["proof"] as? Dictionary<String, String> else { return }
                
                var insideProofName: String = ""
                var insideProofDescription: String = ""
                var insideProofImage: String = ""
                
                if unwrappedProof.keys.contains("proofName") {
                    guard let unwrappedProofName = unwrappedProof["proofName"] else { return }
                    insideProofName = unwrappedProofName
                }
                if unwrappedProof.keys.contains("proofDescription") {
                    guard let unwrappedProofDescription = unwrappedProof["proofDescription"] else { return }
                    insideProofDescription = unwrappedProofDescription
                }
                if unwrappedProof.keys.contains("proofImage") {
                    guard let unwrappedProofImage = unwrappedProof["proofImage"] else { return }
                    insideProofImage = unwrappedProofImage
                }
                outsideProofName = insideProofName
                outsideProofDescription = insideProofDescription
                outsideProofImage = insideProofImage
            }
            // EXAMPLE PROBLEM \\
            // In the code above \\
            // RELATED FORMULAS \\
            // In the code above \\
            // VOCABULARY \\
            var outsideInsideVocabulary: [String] = []
            
            if unwrappedSecondarySubject.keys.contains("vocabulary") {
                guard let unwrappedVocabulary = unwrappedSecondarySubject["vocabulary"] as? Dictionary<String, [String]>,
                    let unwrappedInsideVocabulary = unwrappedVocabulary["vocabulary"] else {
                        print("Failed to get vocabulary")
                        return
                }
                outsideInsideVocabulary = unwrappedInsideVocabulary
            }
            // LOGIC \\
            var outsideInsideLogic: [String] = []
            
            if unwrappedSecondarySubject.keys.contains("logic") {
                guard let unwrappedLogic = unwrappedSecondarySubject["logic"] as? Dictionary<String, [String]>,
                    let unwrappedInsideLogic = unwrappedLogic["logic"] else {
                        print("Faild to get logic")
                        return
                }
                outsideInsideLogic = unwrappedInsideLogic
            }
            // TRICKS \\
            var outsideTricks: [String] = []
            
            if unwrappedSecondarySubject.keys.contains("trick") {
                guard let unwrappedTrick = unwrappedSecondarySubject["trick"] as? Dictionary<String, [String]>,
                    let unwrappedTricks = unwrappedTrick["tricks"] else {
                        print("Failed to get trick")
                        return
                }
                outsideTricks = unwrappedTricks
            }
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
                    proofName : outsideProofName,
                    proofDescription : outsideProofDescription,
                    proofImage : outsideProofImage
                ),
                exampleProblems : exampleProblemsArray,
                relatedFormulas : relatedFormulasArray,
                vocabulary : Vocabulary(
                    vocabulary : outsideInsideVocabulary
                ),
                logic : Logic(
                    logic : outsideInsideLogic
                ),
                tricks : Trick(
                    tricks : outsideTricks
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
