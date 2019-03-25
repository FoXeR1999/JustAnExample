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
        
        latexCell.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
        
        latexCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: latexCell, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: latexCell, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: latexCell, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: latexCell, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 8)
            ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
