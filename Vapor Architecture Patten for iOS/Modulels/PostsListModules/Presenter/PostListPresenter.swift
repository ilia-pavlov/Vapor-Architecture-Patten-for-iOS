//
//  PostListPresenter.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import Foundation

class PostsListPresenter: ViewToPresenterPostsListProtocol {
    var view: PresenterToViewPostsListProtocol?
    var interactor: PresenterToInteractorPostsListProtocol?
    var router: PresenterToRouterPostsListProtocol?
    
    
    func fetchPosts() {
        interactor?.loadPosts()
    }
}

extension PostsListPresenter: InteractorToPresenterPostsListProtocol {
    func postsSuccess(postList: Array<Post>) {
        view?.onPostResponseSucces(postsList: postList)
    }
    
    func postsFailed() {
        view?.onPostResponseFailed(error: "Parsing Error")
    }
}
