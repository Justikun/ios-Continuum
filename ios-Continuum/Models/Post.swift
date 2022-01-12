//
//  Post.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import Foundation
import UIKit

class Post {
    var photoData: Data?
    let timestamp: Date
    let caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(photo: UIImage, timestamp: Date = Date(), caption: String, comments: [Comment] = []) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
}

class Comment {
    let text: String
    let timestamp: Date
    
    init(_ text: String, timestamp: Date = Date()){
        self.text = text
        self.timestamp = timestamp
    }
}
