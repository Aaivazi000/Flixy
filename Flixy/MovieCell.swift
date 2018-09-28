//
//  MovieCell.swift
//  Flixy
//
//  Created by Andriana Aivazians on 9/27/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    //UI Declarations
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
