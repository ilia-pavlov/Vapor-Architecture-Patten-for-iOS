//
//  PostListInteractor.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import Foundation

class PostsListInteractor: PresenterToInteractorPostsListProtocol {
    var presenter: InteractorToPresenterPostsListProtocol?
    
    func loadPosts() {
        PostService.getPosts() { (list, error)  in
            if error == nil {
                self.presenter?.postsSuccess(postList: list!)
            } else {
                self.presenter?.postsFailed()
            }
        }
    }
}
