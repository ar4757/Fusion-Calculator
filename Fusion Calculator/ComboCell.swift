//
//  ComboCell.swift
//  Fusion Calculator
//
//  Created by Andrew Ratz on 4/29/18.
//  Copyright © 2018 Andrew Ratz. All rights reserved.
//

import UIKit

class ComboCell: UITableViewCell {
    
    var firstPersona: Persona?
    var firstName: String?
    var secondPersona: Persona?
    var secondName: String?
    
    
    @IBOutlet weak var firstArcanaLabel: UILabel!
    @IBOutlet weak var secondArcanaLabel: UILabel!
    @IBOutlet weak var firstLevelLabel: UILabel!
    @IBOutlet weak var secondLevelLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
