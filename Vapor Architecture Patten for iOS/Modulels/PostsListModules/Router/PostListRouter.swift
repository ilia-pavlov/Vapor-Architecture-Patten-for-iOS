//
//  PostListRouter.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import Foundation
import UIKit

class PostsListRouter: PresenterToRouterPostsListProtocol {
    
    class func createPostsListModule(postsListRef: PostsViewController) {
        let presenter: ViewToPresenterPostsListProtocol & InteractorToPresenterPostsListProtocol = PostsListPresenter()
        
        postsListRef.postsPresenter = presenter
        postsListRef.postsPresenter?.router = PostsListRouter()
        postsListRef.postsPresenter?.view = postsListRef
        postsListRef.postsPresenter?.interactor = PostsListInteractor()
        postsListRef.postsPresenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
