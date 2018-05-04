//
//  MyTableCell.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 3/24/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {
    
    var persona: Persona?
    var name: String?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var arcanaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        arcanaLabel.layer.cornerRadius = 5
        arcanaLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //Needed, otherwise arcanaLabel looks ugly after being tapped
        let color = self.arcanaLabel.backgroundColor
        super.setSelected(selected, animated: animated)
        self.arcanaLabel.backgroundColor = color
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        //Needed, otherwise arcanaLabel looks ugly after being tapped
        let color = self.arcanaLabel.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        self.arcanaLabel.backgroundColor = color
    }


}
