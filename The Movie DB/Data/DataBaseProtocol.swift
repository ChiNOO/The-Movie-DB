//
//  DataBaseProtocol.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 10/08/21.
//

import Foundation
import RealmSwift

protocol DataBaseProtocol {
    
    func saveMovies(result: List<MovieModel>)
    func getMvovies(type: Int, page: Int, completition: @escaping(ResponseModel) -> Void)
    func getMovieVideo(idMovie: Int, completition: @escaping(ResponseVideoModel) -> Void, error: @escaping (String) -> Void)
    func saveVideo(video: ResponseVideoModel)
    func getMoviesSearch(search: String, completition: @escaping(ResponseModel)-> Void)
}
