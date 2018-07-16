//
//  PostImageCellTableViewCell.swift
//  Makestagram
//
//  Created by George Livas on 13/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import UIKit

class PostImageCellTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
