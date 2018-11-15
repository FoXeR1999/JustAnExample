//
//  GamesTableViewCell.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    @IBOutlet weak var gameTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /*
    func updateCell(with gameName: Game) {
        gameTitle.text = gameName.name
    }
    */
}
