//
//  PostService.swift
//  Makestagram
//
//  Created by George Livas on 12/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            
            create(forURLString: urlString, aspectHeight: aspectHeight)
        }
    }
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
        // get the location of the important objects
        let currentUser = User.current
        let post = Post(imageUrl: urlString, imageHeight: aspectHeight)
        
        let rootRef = Database.database().reference()
        let newPostRef = rootRef.child("posts").child(currentUser.uid).childByAutoId()
        let newPostKey = newPostRef.key
        
        // get all the followers of the current user
        UserService.followers(for: currentUser) { (followerUIDs) in
            let timelinePostDict = ["poster_uid": currentUser.uid]
            
            // push the data
            var updatedData: [String : Any] = ["timeline/\(currentUser.uid)/\(newPostKey)": timelinePostDict]
            
            // push the data to every other users that are following the current user
            for uid in followerUIDs {
                updatedData["timeline/\(uid)/\(newPostKey)"] = timelinePostDict
            }
            
            let postDict = post.dictValue
            updatedData["timeline/\(currentUser.uid)/\(newPostKey)"] = postDict
            
            // write the data to the database
            rootRef.updateChildValues(updatedData)
        }
    }
}
