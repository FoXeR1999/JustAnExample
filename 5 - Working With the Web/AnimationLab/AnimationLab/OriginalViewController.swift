//
//  ViewController.swift
//  AnimationLab
//
//  Created by Justin Herzog on 12/4/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class OriginalViewController: UIViewController {
    
    ///////////////////////////////
    // MARK: buttons and things //
    /////////////////////////////
    
    @IBAction func submitButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToCongratsScreen", sender: self)
        
    }
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    ///////////////////
    // MARK: People //
    /////////////////
    
    @IBOutlet weak var enteredPeopleLabel: UILabel!
    
    var defaultPeopleLabelNumber: Int = Int.random(in: 108362 ... 594762)
    
    func actuallyUpdate() {
        if backgroundLoop > -1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.2 ... 4.0)) {
                self.upTheNumber()
                self.updateEnteredPeopleLabel()
                self.actuallyUpdate()
            }
        }
    }
    
    func updateEnteredPeopleLabel() {
        enteredPeopleLabel.text = String(defaultPeopleLabelNumber)
    }
    
    func upTheNumber() {
        let updatedNumber = defaultPeopleLabelNumber + Int.random(in: 28 ... 312)
        
        defaultPeopleLabelNumber = updatedNumber
        
    }
    
    //////////////////////////
    // MARK: Cancer Colors //
    ////////////////////////
    
    var backgroundColors = [UIColor()]
    var backgroundLoop = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColors = [UIColor.red, UIColor.orange, UIColor.green, UIColor.purple, UIColor.blue, UIColor.yellow, UIColor.cyan]
        backgroundLoop = 0
        
        self.animateBackgroundColor()
        self.updateEnteredPeopleLabel()
        self.actuallyUpdate()
        
    }
    
    
    func animateBackgroundColor() {
        if backgroundLoop < backgroundColors.count - 1 {
            backgroundLoop += 1
            
        } else {
            backgroundLoop = 0
            animateSubmitButton()
        }
        
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            self.view.backgroundColor = self.backgroundColors[self.backgroundLoop];
        }) {(Bool) -> Void in
            self.animateBackgroundColor();
        }
    }
    
    func animateSubmitButton() {
        if backgroundLoop <= 2 {
            
            UIView.animate(withDuration: 0.05, animations: {
                self.submitButton.transform = CGAffineTransform(translationX: 10, y: 0)
            }) { _ in
                UIView.animate(withDuration: 0.05, animations: {
                    self.submitButton.transform = CGAffineTransform(translationX: -20, y: 0)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.05, animations: {
                        self.submitButton.transform = .identity
                    })
                })
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let congratsViewController = segue.destination as? CongratsViewController {
            congratsViewController.loadViewIfNeeded()
            
            congratsViewController.congratsLabel.text = "Congratulations! An email will be sent to \(self.emailTextField.text ?? "your email") as soon as possible!"
        }
        
    }
    
}
