//
//  VideoModel.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 11/08/21.
//

import Foundation
import RealmSwift
import ObjectMapper_Realm
import ObjectMapper

class VideoModel: Object, Mappable{
  
    @objc dynamic var id_local: String = NSUUID().uuidString;
    @objc dynamic var id: String = ""
    @objc dynamic var iso_639_1: String = ""
    @objc dynamic var iso_3166_1: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var key: String = ""
    @objc dynamic var site: String = ""
    @objc dynamic var size = 0
    @objc dynamic var type: String = ""
    @objc dynamic var official: Bool = true
    @objc dynamic var published_at: Bool = false
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public static func primaryKey() -> String? {
        return "id_local"
    }

    
    public func mapping(map: Map){
        id          <- map["id"]
        iso_639_1   <- map["iso_639_1"]
        iso_3166_1  <- map["iso_3166_1"]
        name        <- map["name"]
        key         <- map["key"]
        site        <- map["site"]
        size        <- map["size"]
        type        <- map["type"]
        official    <- map["official"]
        published_at <- map["published_at"]
    }

}
