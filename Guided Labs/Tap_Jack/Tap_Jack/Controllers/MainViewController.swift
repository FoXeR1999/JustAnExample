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
    
    //// Get rid of lag after clicking a card??
    
    var pictureIndex: Int = 0
    
    var xIndex: Int = 0
    
    var scoreIndex: Int = 0
    
    var timer = Timer()
    
    var cardsArray: [Cards] = []
    
    var imageArray: [UIImage] = []
    
    var cardDeckItemArray: [CardDeckItem] = []
    
    let deckController = DeckController()
    
    let cardController = CardController()
    
    let newDeckURL = URL(string: "https://deckofcardsapi.com/api/deck/")
    
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var deckCountLabel: UILabel!
    
    @IBOutlet weak var cardPicture: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCardImages()
        cardPicture.isHidden = true
        //// Initialize the Button ////////
        startButton.isHidden = false
        startButton.layer.cornerRadius = 5
        startButton.contentRect(forBounds: buttonRect)
        //////////////////////////////////
        pauseButton.layer.cornerRadius = 10
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
        cardPicture.isUserInteractionEnabled = true
        runTimer()
    }
    ///////////////////////////////////////////////////////////////////
    
    func getCardImages() {
        cardController.getCardURL(completion: { (fetchedImageArray) in
            self.imageArray = fetchedImageArray
        }, cardsCompletion: { (fetchedCardsArray) in
            guard let fetchedCardsArray = fetchedCardsArray else { return }
            self.cardsArray = fetchedCardsArray
        }) { (fetchedCardDeckItemArray) in
            guard let fetchedCardDeckItemArray = fetchedCardDeckItemArray else { return }
            self.cardDeckItemArray = fetchedCardDeckItemArray
        }
    }

    @objc func displayNewCard() {
        
        cardPicture.image = cardDeckItemArray[pictureIndex].image
        deckCountLabel.text = String(52 - pictureIndex)
        pictureIndex += 1
        
        if pictureIndex == 52 {
            pictureIndex = 0
            cardDeckItemArray.shuffle()
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayNewCard), userInfo: nil, repeats: true)
    }
    
    @IBAction func cardTapped(_ sender: Any) {
        
        timer.invalidate()
        runTimer()
        
        if pictureIndex == 0 {
            pictureIndex += 1
        }
        
        let currentCardID = cardDeckItemArray[pictureIndex - 1].card
        
        if pictureIndex == 1 {
            pictureIndex = 0
        }
        
        guard let unwrappedCurrentCardValue = currentCardID.value else { return }
        
        if unwrappedCurrentCardValue == "JACK" {
            scoreIndex += 1
            scoreLabel.text = "Score \n\(scoreIndex)"
        } else {
            scoreIndex -= 1
            scoreLabel.text = "Score \n\(scoreIndex)"
        }
        
        if pictureIndex == 51 {
            pictureIndex = 0
        }
        
        cardPicture.image = cardDeckItemArray[pictureIndex].image
        deckCountLabel.text = String(52 - pictureIndex)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        
    }
}
