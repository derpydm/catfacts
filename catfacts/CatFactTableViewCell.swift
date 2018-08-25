//
//  CatFactTableViewCell.swift
//  catfacts
//
//  Created by Sean on 25/8/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class CatFactTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
