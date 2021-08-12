//
//  ApiConnection.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 06/08/21.
//

import Foundation
import RealmSwift

public class ApiConnection {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    static let shared : ApiConnection = ApiConnection()
    let decoderdec = JSONDecoder()

}

extension ApiConnection: ApiConnectionProtocol{
   
    func getMovies(type: Int, page: Int, completition: @escaping (ResponseModel) -> Void, error: @escaping (String) -> Void) {
        
        let urlConnection = UrlConnection.getUrlType(type: type)
                
        if let urlComponents = URLComponents(string: urlConnection + page.description) {
            
            if let url = urlComponents.url  {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue(UrlConnection.bearer, forHTTPHeaderField: "Login")
                dataTask = defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    defer {
                      self?.dataTask = nil
                    }
                    if let errorUrl = error {
                        print("ok")
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                      
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            let responseModel = ResponseModel.init(JSON: json as! [String : Any])
                           
                            DispatchQueue.main.async {
                                completition(responseModel!)
                            }
                            
                        } catch  {
                           print("Error")
                        }
                        
                        
                    }else{
                        print("ok")
                    }
                }
                
            }else{
                print("ok")

            }
            dataTask?.resume()
        }else{
            print("ok")

        }
        
    }
    
    func getMovieVideo(idMovie: Int, completition: @escaping (ResponseVideoModel) -> Void, error: @escaping (String) -> Void){
    
        let urlConnection = UrlConnection.videoBase + idMovie.description + UrlConnection.vide
        if let urlComponents = URLComponents(string: urlConnection) {
            
            if let url = urlComponents.url  {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue(UrlConnection.bearer, forHTTPHeaderField: "Login")
                dataTask = defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    defer {
                      self?.dataTask = nil
                    }
                    if let errorUrl = error {
                        print("ok")
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                      
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            let responseModel = ResponseVideoModel.init(JSON: json as! [String : Any])
                           
                            DispatchQueue.main.async {
                                completition(responseModel!)
                            }
                            
                        } catch  {
                           print("Error")
                        }
                        
                        
                    }else{
                        print("ok")
                    }
                }
                
            }else{
                print("ok")

            }
            dataTask?.resume()
        }else{
            print("ok")

        }
        
    }
            
            
    func getMoviesSearch(search: String, completition: @escaping (ResponseModel) -> Void, error: @escaping (String) -> Void) {
        
        let urlConnection = UrlConnection.searchBase + search + UrlConnection.search
        if let urlComponents = URLComponents(string: urlConnection) {
            
            if let url = urlComponents.url  {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue(UrlConnection.bearer, forHTTPHeaderField: "Login")
                dataTask = defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    defer {
                      self?.dataTask = nil
                    }
                    if let errorUrl = error {
                        print("ok")
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                      
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                            let responseModel = ResponseModel.init(JSON: json as! [String : Any])
                           
                            DispatchQueue.main.async {
                                completition(responseModel!)
                            }
                            
                        } catch  {
                           print("Error")
                        }
                        
                        
                    }else{
                        print("ok")
                    }
                }
                
            }else{
                print("ok")

            }
            dataTask?.resume()
        }else{
            print("ok")

        }
        
    }
    
    
    
}
