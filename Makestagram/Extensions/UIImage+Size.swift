//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by George Livas on 12/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
