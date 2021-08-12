//
//  MovieModel.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 06/08/21.
//

import Foundation
import RealmSwift
import ObjectMapper_Realm
import ObjectMapper

class MovieModel: Object, Mappable{
  
    @objc dynamic var id = 0
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdrop_path: String = ""
    @objc dynamic var original_title: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity = 0.0
    @objc dynamic var poster_path: String = ""
    @objc dynamic var release_date: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var vote_average = 0.0
    @objc dynamic var vote_count = 0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }

    
    public func mapping(map: Map){
        id              <- map["id"]
        adult           <- map["adult"]
        backdrop_path   <- map["backdrop_path"]
        original_title  <- map["original_title"]
        overview        <- map["overview"]
        popularity      <- map["popularity"]
        poster_path     <- map["poster_path"]
        release_date    <- map["release_date"]
        title           <- map["title"]
        video           <- map["video"]
        vote_average    <- map["vote_average"]
        vote_count      <- map["vote_count"]
    }

}
