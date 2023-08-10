//
//  Post.swift
//  Vapor Architecture Patten for iOS
//
//  Created by Ilia Pavlov on 8/9/23.
//

import Foundation
import ObjectMapper


struct Post : Mappable {
   var userId : Int?
   var id : Int?
   var title : String?
   var body : String?
   init?(map: Map) {}
   
   mutating func mapping(map: Map) {
      userId <- map["userId"]
      id <- map["id"]
      title <- map["title"]
      body <- map["body"]
  }
}
