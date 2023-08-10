//
//  PostService.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import Foundation
import Alamofire

class PostService {
    static func getPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts?userId=1"
        Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response in
                
                if let data = response.result.value {
                    let jsonResponse = data as! NSArray
                    let dictionaryItems = jsonResponse as? [[String: Any]]
                    
                    guard let arrayItems = dictionaryItems else {
                        completionHandler(nil,BackendError.internalError(reason: "Parsing error"))
                        return
                    }
                    
                    let listPosts = arrayItems.map({ (dic) -> Post in
                        return Post(JSON: dic)!
                    })
                    
                    completionHandler(listPosts, nil)
                    
                } else {
                    completionHandler(nil, BackendError.technicalProblem)
                    
            }
        })
    }
}
