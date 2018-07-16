//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by George Livas on 12/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let photoHelper = MGPhotoHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            photoHelper.presentActionSheet(from: self)
            return false
        }
        
        return true
    }
}
