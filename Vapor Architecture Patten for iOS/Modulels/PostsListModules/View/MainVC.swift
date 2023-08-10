//
//  MainVC.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listPosts: [Post] = []
    var postsPresenter: ViewToPresenterPostsListProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        PostsListRouter.createPostsListModule(postsListRef: self)
        postsPresenter?.fetchPosts()
    }
}

extension PostsViewController: PresenterToViewPostsListProtocol {
    
    func onPostResponseSucces(postsList: Array<Post>) {
        self.listPosts = postsList
        self.tableView.reloadData()
    }
    
    func onPostResponseFailed(error: String) {
        print(error)
    }
}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = "task \(indexPath.row): \(self.listPosts[indexPath.row].title!)"
        
        return cell
    }
}
