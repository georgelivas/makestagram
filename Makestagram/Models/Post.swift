//
//  Post.swift
//  Makestagram
//
//  Created by George Livas on 12/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post {
    var key: String?
    let imageUrl: String
    let imageHeight: CGFloat
    let creationDate: Date
    var likeCount: Int
    let poster: User
    var isLiked = false
    
    var dictValue: [String: Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        let userDict = ["uid": poster.uid,
                        "username": poster.username]
        
        return ["image_url": imageUrl,
                "image_height": imageHeight,
                "created_at": createdAgo,
                "like_count": likeCount,
                "poster": userDict]
    }
    
    init(imageUrl: String, imageHeight: CGFloat) {
        self.imageUrl = imageUrl
        self.imageHeight = imageHeight
        self.creationDate = Date()
        self.likeCount = 0
        self.poster = User.current
    }
    
    // init for posts based on the user info object
    // this kind of init can be nil, if nil, it will use the init above
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval
            else { return nil }
        
        self.key = snapshot.key
        self.imageUrl = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
}
