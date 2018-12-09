//
//  ComboCell.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 4/29/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class ComboCell: UITableViewCell {
    
    var persona: Persona?
    var name: String?
    
    
    @IBOutlet weak var arcanaLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
