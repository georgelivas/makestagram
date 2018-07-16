//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by George Livas on 13/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
}
