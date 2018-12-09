//
//  SkillDetailsViewController.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 4/29/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class SkillDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        costLabel.frame = CGRect(x: costLabel.frame.minX, y: costLabel.frame.minY, width: 54, height: 14)
        costLabel.layer.cornerRadius = 5
        costLabel.layer.masksToBounds = true
        imageView.frame = CGRect(x: imageView.frame.minX, y: imageView.frame.minY, width: 54, height: 14)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }
    
}

