//
//  PostController.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import Foundation
import UIKit

class PostController {
    // MARK: - Properties
    static let shared = PostController()
    /// Source of Truth
    var posts: [Post] = []
    
    
    // MARK: - Methods
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let comment = Comment(text)
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void) {
        let post = Post(photo: image, caption: caption)
        posts.append(post)
    }
    
}
