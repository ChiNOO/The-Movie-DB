//
//  ResponseModel.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 06/08/21.
//

import Foundation
import RealmSwift
import ObjectMapper_Realm
import ObjectMapper

class ResponseModel: Object, Mappable{
  
    
    @objc dynamic var id_local: String = NSUUID().uuidString;
    @objc dynamic var page = 0
    @objc dynamic var total_pages = 0
    @objc dynamic var total_results = 0
    var results = List<MovieModel>()

    
    required convenience public init?(map: Map) {
        self.init()
        id_local = NSUUID().uuidString;
    }
    
    override public static func primaryKey() -> String? {
        return "id_local"
    }

    
    public func mapping(map: Map){
        page            <- map["page"]
        total_pages     <- map["total_pages"]
        total_results   <- map["total_results"]
        results         <- (map["results"], ListTransform<MovieModel>())
    }
    
}
