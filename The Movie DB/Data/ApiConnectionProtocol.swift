//
//  ApiConnectionProtocol.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 09/08/21.
//

import Foundation

protocol ApiConnectionProtocol {
    
    func getMovies(type: Int, page: Int, completition: @escaping(ResponseModel) -> Void, error: @escaping(String) -> Void)
    func getMovieVideo(idMovie: Int, completition: @escaping(ResponseVideoModel) -> Void, error: @escaping(String) -> Void)
    func getMoviesSearch(search: String, completition: @escaping(ResponseModel)-> Void, error: @escaping(String) -> Void)
}
