//
//  ProofViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import iosMath

class ProofViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var latexProofName = MTMathUILabel(frame: .zero)
    var latexProofDescription = MTMathUILabel(frame: .zero)
    
    var proofName: String = ""
    var proofImageName: String = ""
    var proofDescription: String = ""
    
    @IBOutlet weak var proofNameLabel: UILabel!
    @IBOutlet weak var proofImage: UIImageView!
    @IBOutlet weak var proofDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(latexProofName)
        scrollView.addSubview(latexProofDescription)
        latexProofName.isHidden = true
        latexProofName.textAlignment = .center
        latexProofDescription.isHidden = true
        latexProofDescription.textAlignment = .center
        proofNameLabel.isHidden = false
        proofDescriptionLabel.isHidden = false
        
        if proofName.contains("displaystyle") {
            latexProofName.isHidden = false
            proofNameLabel.isHidden = true
            latexProofName.latex = proofName
            latexProofName.fontSize = 30
            
            latexProofName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexProofName, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexProofName, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            proofNameLabel.text = proofName
            proofNameLabel.isHidden = false
        }
        
        if proofDescription.contains("displaystyle") {
            latexProofDescription.isHidden = false
            proofDescriptionLabel.isHidden = true
            latexProofDescription.latex = proofDescription
            latexProofDescription.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexProofDescription, attribute: .top, relatedBy: .equal, toItem: latexProofName, attribute: .top, multiplier: 1, constant: 32),
                NSLayoutConstraint(item: latexProofDescription, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexProofDescription, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else if proofDescription.contains("displaystyle") && proofImageName != "" {
            latexProofDescription.isHidden = false
            proofDescriptionLabel.isHidden = true
            latexProofDescription.latex = proofDescription
            latexProofDescription.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexProofDescription, attribute: .top, relatedBy: .equal, toItem: proofImage, attribute: .top, multiplier: 1, constant: 32),
                NSLayoutConstraint(item: latexProofDescription, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexProofDescription, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            proofDescriptionLabel.text = proofDescription
            proofDescriptionLabel.isHidden = false
        }
        
        if proofImageName != "" {
            proofImage.image = UIImage(named: proofImageName)
            proofImage.frame = CGRect(x: 0, y: 0, width: 359, height: 359)
        } else {
            proofImage.isHidden = true
            proofImage.frame = CGRect(x: 0, y: 0, width: 359, height: 0)

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
