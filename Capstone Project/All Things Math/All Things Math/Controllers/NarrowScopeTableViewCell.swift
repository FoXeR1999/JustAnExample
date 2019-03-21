//
//  NarrowScopeTableViewCell.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/20/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import iosMath

class NarrowScopeTableViewCell: UITableViewCell {
    
    var narrowScopeTVC = NarrowScopeSubjectTableViewController()
    
    var latexCell = MTMathUILabel(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(latexCell)
        latexCell.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
