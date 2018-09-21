//
//  ViewController.swift
//  SomeBasicControls
//
//  Created by Justin Herzog on 9/20/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: This is the Switch
    
    @IBOutlet weak var toggledChangeBackground: UISwitch!
    
    @IBAction func changeBackground(_ sender: Any) {
        if toggledChangeBackground.isOn {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor(red: 0.5569, green: 0.5569, blue: 0.5569, alpha: 1.0)
        }
        
    }
    
    // MARK: This is the Slider
    
    @IBOutlet weak var toggledChangeHue: UISlider!
    
    
    @IBAction func changeHue(_ sender: Any) {
        var sliderValue = toggledChangeHue.value
        // print(toggledChangeHue.value)
        if (toggledChangeHue != nil) {
            self.view.backgroundColor = UIColor(hue: CGFloat(sliderValue), saturation: 0.5, brightness: 1, alpha: 1.0)
        }
        
    }
    
    // MARK: This is the button
    
    @IBOutlet weak var toggledResetScreen: UIButton!
    
    @IBAction func resetScreen(_ sender: Any) {
        self.view.backgroundColor = UIColor.white
    }
    
    // MARK: This is the UITextfield
    
    @IBOutlet weak var toggledTextField: UITextField!
    
    @IBAction func textField(_ sender: Any) {
        print("I'm Done")
        
        if (toggledTextField.isEditing) {
            labelChange == toggledTextField
        }
    }
    
    
    // MARK: This is the Label
    
    @IBOutlet weak var labelChange: UILabel!
    
    
}
