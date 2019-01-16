//
//  EditPersonViewController.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class EditPersonViewController: UIViewController, UITextFieldDelegate {
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if let unwrappedPersonTextFieldText = personNameTextField.text {
//            if unwrappedPersonTextFieldText.count > 0 {
//                personNameTextField.backgroundColor = UIColor.white
//            }
//        }
//    }
    
    func addsAsterisk(string: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string + "*")
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: NSRange(location: string.count, length: 1))
        return attributedString
    }
    
    func animatePersonTextField() {
        let transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.personNameTextField.transform = transform
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                self.personNameTextField.transform = .identity
            }
        }
    }
    
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var emojiTextField: UITextField!
    
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    var person: Person? {
        didSet {
            guard let person = person else { return }
            
            personNameTextField.text = person.name
        }
    }
    
    var emoji: Emoji? {
        didSet {
            guard let emoji = emoji else { return }
            
            emojiTextField.text = emoji.emoji
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personNameTextField.delegate = self
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let unwrappedTextField = personNameTextField.text?.isEmpty {
            if unwrappedTextField == true {
                personNameTextField.attributedPlaceholder = NSAttributedString(string: "You must fill this out to save your person")
                personNameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.15)
                if let unwrappedPersonLabelText = personLabel.text, !unwrappedPersonLabelText.contains("*") {
                    personLabel.attributedText = addsAsterisk(string: personLabel.text!)
                }
                animatePersonTextField()
                return
            }
        }
        
        guard let name = personNameTextField.text,
            let emojiInTextField = emojiTextField.text else { return }
        
        if let person = person {
            person.name = name
            PersonController.sharedPersonController.savePerson()
        } else {
            PersonController.sharedPersonController.createPerson(name: name)
        }
        
        if let emoji = emoji {
            emoji.emoji = emojiInTextField
            EmojiController.sharedEmojiController.saveEmoji()
        } else {
            EmojiController.sharedEmojiController.createEmoji(emoji: emojiInTextField)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
