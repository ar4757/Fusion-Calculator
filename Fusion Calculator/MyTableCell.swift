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

    @IBOutlet weak var lblFirstRow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
