//
//  PostListTableViewController.swift
//  ios-Continuum
//
//  Created by Justin Lowry on 1/11/22.
//

import UIKit

class PostListTableViewController: UITableViewController {
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return PostController.shared.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = PostController.shared.posts[indexPath.row]
        cell.post = post
        

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        if segue.identifier == "toPostDetailVC",
           let indexPath = tableView.indexPathForSelectedRow,
           let destination = segue.destination as? PostDetailTableViewController {
            let post = PostController.shared.posts[indexPath.row]
            destination.post = post
        }
    }

}
