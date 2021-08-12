//
//  DataBase.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 06/08/21.
//

import Foundation
import RealmSwift

public class DataBase {
    
    static let shared: DataBase = DataBase()
    let realm = try! Realm()

}


extension DataBase: DataBaseProtocol{
    
    func getMoviesSearch(search: String, completition: @escaping (ResponseModel) -> Void) {
        
        let movies: List<MovieModel> = List<MovieModel>()
        let sortedMovies = realm.objects(MovieModel.self)
        
        for movie in sortedMovies{
            if (movie.title.lowercased().range(of: search.lowercased()) != nil) {
                movies.append(movie)
            }
        }
        
        let response = ResponseModel()
        try! realm.write {
            response.page = 1
            response.results = movies
        }
        
        completition(response)
      
        

    }
    
    func saveVideo(video: ResponseVideoModel) {
        try! realm.write{
            realm.add(video, update: .modified)
        }
    }
    

    
    func getMovieVideo(idMovie: Int, completition: @escaping (ResponseVideoModel) -> Void, error: @escaping  (String) -> Void) {
        let videoResponse = realm.objects(ResponseVideoModel.self).filter("id = " + idMovie.description)
        if let response = videoResponse.first {
            completition(response)
        }else{
            error("error")
        }
    }
    

    func saveMovies(result: List<MovieModel>) {
        try! realm.write {
            realm.add(result, update: .modified)
        }
    }
    
    
    func getMvovies(type: Int, page: Int, completition: @escaping (ResponseModel) -> Void) {
        let movies: List<MovieModel> = List<MovieModel>()
        let sortedMovies = realm.objects(MovieModel.self).sorted(byKeyPath: "popularity", ascending: false)
        
        for movie in sortedMovies{
            movies.append(movie)
        }
        
        let response = ResponseModel()
        try! realm.write {
            response.page = page
            response.results = movies
        }
        
        completition(response)
        

    }
    
}
