//
//  TrailersTableViewCell.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/19/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class TrailersTableViewCell: UITableViewCell {

    @IBOutlet weak var trailerLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
