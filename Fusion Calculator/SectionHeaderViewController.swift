//
//  SectionHeaderViewController.swift
//  ChameleonFramework
//
//  Created by Andrew Ratz on 12/8/18.
//

import UIKit

class SectionHeaderViewController: UITableViewCell {
    
    @IBOutlet weak var costLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //arcanaLabel.frame = CGRect(x: arcanaLabel.frame.minX, y: arcanaLabel.frame.minY, width: 104, height: 37)
        //arcanaLabel.layer.cornerRadius = 5
        //arcanaLabel.layer.masksToBounds = true
    }

}

