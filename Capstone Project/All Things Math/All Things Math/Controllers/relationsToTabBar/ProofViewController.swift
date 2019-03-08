//
//  ProofViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class ProofViewController: UIViewController {

    var proofName: String = ""
    var proofImageName: String = ""
    var proofDescription: String = ""
    
    @IBOutlet weak var proofNameLabel: UILabel!
    @IBOutlet weak var proofImage: UIImageView!
    @IBOutlet weak var proofDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if proofImageName != "" {
            proofImage.image = UIImage(named: proofImageName)
        } else {
            proofImage.isHidden = true
        }
        proofNameLabel.text = proofName
        proofDescriptionLabel.text = proofDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
