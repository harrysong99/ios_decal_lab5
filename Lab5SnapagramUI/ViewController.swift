//
//  ViewController.swift
//  Lab5SnapagramUI
//
//  Created by Nikhil Yerasi on 3/4/20.
//  Copyright © 2020 nyerasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource {
    
    @IBOutlet weak var threadCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    // reference for our model
    var feedData: FeedData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadCollectionView.dataSource = self
        feedTableView.dataSource = self
        self.feedData = FeedData()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedData.threads.count // return the number of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        let thread = feedData.threads[index]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threadCell", for: indexPath) as? ThreadCollectionViewCell {
            cell.emojiLabel.text = thread.emoji
            cell.nameLabel.text = thread.name
            cell.unreadLabel.text = String(thread.unread)
            
            // styling
            cell.unreadLabel.backgroundColor = Constants.snapagramBlue
            cell.unreadLabel.layer.masksToBounds = true
            cell.unreadLabel.layer.cornerRadius = cell.unreadLabel.frame.width / 2
            
            cell.emojiLabel.layer.borderWidth = 3 // default black
            cell.emojiLabel.layer.cornerRadius = cell.emojiLabel.frame.width / 2
            
            // if unread is 0 we don't need to display indicator
            if thread.unread == 0 {
                cell.unreadLabel.alpha = 0 // transparency
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.posts.count // return the number of posts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let post = feedData.posts[index]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTableViewCell {
            cell.locationLabel.text = post.location
            cell.postImageView.image = post.image
            cell.postLabel.text = post.caption
            cell.usernameLabel.text = post.user
            
            // styling
            cell.self.backgroundColor = Constants.snapagramYellow
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    

}

