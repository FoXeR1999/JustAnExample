//
//  EditPersonViewController.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class EditPersonViewController: UIViewController {
    
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
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
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
