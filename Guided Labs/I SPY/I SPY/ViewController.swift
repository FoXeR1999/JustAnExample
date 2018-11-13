//
//  ViewController.swift
//  I SPY
//
//  Created by Justin Herzog on 11/13/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var linkImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        updateZoomFor(size: view.bounds.size)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return linkImage
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / linkImage.bounds.width
        let heightScale = size.height / linkImage.bounds.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
    }

}

