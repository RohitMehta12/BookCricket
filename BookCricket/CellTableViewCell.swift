//
//  CellTableViewCell.swift
//  BookCricket
//
//  Created by Rohit Mehta on 8/7/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
