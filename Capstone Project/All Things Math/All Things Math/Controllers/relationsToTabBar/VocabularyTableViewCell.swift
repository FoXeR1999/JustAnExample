//
//  VocabularyTableViewCell.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/11/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class VocabularyTableViewCell: UITableViewCell {

    @IBOutlet weak var vocabularyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
