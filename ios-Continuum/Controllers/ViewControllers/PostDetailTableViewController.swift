//
//  PostDetailTableViewController.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    // MARK: - Properties
    var post: Post? {
        didSet {
            
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func commentButtonPressed(_ sender: Any) {
    
    }
    @IBAction func shareButtonPressed(_ sender: Any) {
    }
    @IBAction func followPostButtonPressed(_ sender: Any) {
    }
    
    // MARK: - Methods
    func presentCommentAlertController() {
        let alert = UIAlertController(title: "Add a comment", message: "Add a comment", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Begin typing..."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let commentAction = UIAlertAction(title: "Comment", style: .default) { _ in
            guard let commentText = alert.textFields?.first?.text,
                  !commentText.isEmpty,
                  let post = self.post else { return }
            PostController.shared.addComment(text: commentText, post: post) { _ in }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(commentAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateView() {
        guard let post = post else { return }
        photoImageView.image = post.photo
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else { return 0 }

        return post.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailPostCommentsCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = post?.comments[indexPath.row].text
        content.secondaryText = "\(post?.comments[indexPath.row].timestamp)"
        
        return cell
    }
}
