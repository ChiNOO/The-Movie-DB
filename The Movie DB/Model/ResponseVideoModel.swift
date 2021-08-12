//
//  ResponseVideoModel.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 11/08/21.
//

import Foundation
import RealmSwift
import ObjectMapper_Realm
import ObjectMapper

class ResponseVideoModel: Object, Mappable{
  
    
    @objc dynamic var id = 0
    var results = List<VideoModel>()

    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }

    
    public func mapping(map: Map){
        id      <- map["id"]
        results <- (map["results"], ListTransform<VideoModel>())
    }
    
}
