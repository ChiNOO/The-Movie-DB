//
//  UrlConnection.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 07/08/21.
//

import Foundation

public class UrlConnection {
    
    static let apiKey = "055e246dfe684641f88ea0498b055585"
    static let baseUrl = "https://api.themoviedb.org"
  
    static let pop = baseUrl + "/3/movie/popular?api_key=" + apiKey + "&language=es-MX&include_video=true&page="
    
    static let topRated = baseUrl + "/3/movie/top_rated?api_key=" + apiKey + "&language=es-MX&include_video=true&page="
    
    static let dateRelease = baseUrl + "/3/movie/upcoming?api_key=" + apiKey + "&language=es-MX&include_video=true&page="
    
    static let videoBase = "https://api.themoviedb.org/3/movie/"
    static let vide = "/videos?api_key=055e246dfe684641f88ea0498b055585&language=es-MX"
    
    
    static let authorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNTVlMjQ2ZGZlNjg0NjQxZjg4ZWEwNDk4YjA1NTU4NSIsInN1YiI6IjYxMDlmNzlhMmY4ZDA5MDA3NDlhMDY0NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VycjcOXboT9FMR2AWi6Neo4FXk5u_7Ce1C-2d1kTX0wa"
    static let bearer = "bearer" + authorization
    static let imagesPath = "https://image.tmdb.org/t/p/w500"
    
    static let searchBase = "https://api.themoviedb.org/3/search/movie?api_key=055e246dfe684641f88ea0498b055585&language=en-US&query="
    
    static let search = "&page=1&include_adult=false"
    
    static func getUrlType(type: Int) -> String{
        
        switch type {
        case 1:
            return pop
        case 2:
            return topRated
        case 3:
            return dateRelease
        default:
            return pop
        }
        
    }
}
