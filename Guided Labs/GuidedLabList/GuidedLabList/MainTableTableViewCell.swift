//
//  MainTableTableViewCell.swift
//  GuidedLabList
//
//  Created by Justin Herzog on 11/26/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class MainTableTableViewCell: UITableViewCell {

    var homework: Homework? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var assignmentLabel: UILabel!
    
    @IBOutlet weak var dueDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell() {
        if let unwrappedHomework = homework {
            classLabel.text = unwrappedHomework.className
            assignmentLabel.text = unwrappedHomework.homework
            dueDate.text = unwrappedHomework.dueDate
        } else {
            classLabel.text = nil
            assignmentLabel.text = nil
            dueDate.text = nil
        }
    }
    
}
