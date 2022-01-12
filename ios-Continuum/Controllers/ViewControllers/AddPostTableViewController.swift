//
//  AddPostTableViewController.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectImageButton.setTitle("Select Image", for: .normal)
        postImageView.image = nil
        captionTextField.text = ""
    }
    
    // MARK: - Actions
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        postImageView.image = UIImage(named: "spaceEmptyState")
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let postImage = postImageView.image,
              let captionText = captionTextField.text,
              !captionText.isEmpty else { return }
        PostController.shared.createPostWith(image: postImage, caption: captionText) { _ in }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
} // End of class

extension AddPostTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

