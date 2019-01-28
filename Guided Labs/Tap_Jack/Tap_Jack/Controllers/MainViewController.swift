//
//  MainViewController.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/17/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var timer = Timer()
    
    let deckController = DeckController()
    
    let cardController = CardController()
    
    let newDeckURL = URL(string: "https://deckofcardsapi.com/api/deck/")
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var deckCountLabel: UILabel!
    
    @IBOutlet weak var cardPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardPicture.isHidden = true
        //// Initialize the Button ////////
        startButton.isHidden = false
        startButton.layer.cornerRadius = 5
        startButton.contentRect(forBounds: buttonRect)
        //////////////////////////////////
        //fetchDeck()
    }
    
    ////////////////////////
    // MARK: startButton //
    //////////////////////
    
    @IBAction func startButtonTapped(_ sender: Any) {
        startButtonAnimation()
    }
    
    var buttonRect = CGRect(x: 0, y: 0, width: 175, height: 100)
    
    func startButtonAnimation() {
        UIView.animate(withDuration: 0.75, animations: {
            self.startButton.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        }, completion: { _ in
            self.startButton.isHidden = true
        })
        cardPicture.isHidden = false
        
        cardController.getCards { (results) in
            print(results)
        }
    }
    ///////////////////////////////////////////////////////////////////
    
    @IBAction func testerButtonTapped(_ sender: Any) {
        
    }
    
    @objc func displayNewCard() {
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayNewCard), userInfo: nil, repeats: true)
    }
    
  
}
