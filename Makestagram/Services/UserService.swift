//
//  UserService.swift
//  Makestagram
//
//  Created by George Livas on 10/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
