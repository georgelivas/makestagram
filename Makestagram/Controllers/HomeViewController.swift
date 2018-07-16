//
//  HomeViewController.swift
//  Makestagram
//
//  Created by George Livas on 12/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        // remove separators for empty cells
        tableView.tableFooterView = UIView()
        // remove separators from cells
        tableView.separatorStyle = .none
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath) as! PostImageCellTableViewCell
        
        let imageURL = URL(string: post.imageUrl)
        cell.postImageView.kf.setImage(with: imageURL)
        
        return cell
    }
}
