//
//  ScoresTableViewCell.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ScoresTableViewCell: UITableViewCell {

    var player: Player? {
        didSet {
            updateCell()
        }
    }
    /////////////////////////////////////////////////////////////
    // MARK: Actions
    /////////////////////////////////////////////////////////////
    
    @IBAction func scoresStepperValueChanged(_ sender: UIStepper) {
        
        scoreLabel.text = Int(sender.value).description
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var playerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell() {
        if let unwrappedPlayer = player {
            playerLabel.text = unwrappedPlayer.name
        }
    }
    
}
