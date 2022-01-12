//
//  PostTableViewCell.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    
    // MARK: - Methods
    func updateViews() {
        guard let post = post else { return }
        postImage.image = post.photo
        captionLabel.text = post.caption
        commentCountLabel.text = "\(post.comments.count)"
    }

}
