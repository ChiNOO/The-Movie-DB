//
//  MainInteractor.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 07/08/21.
//

import Foundation

protocol MainUseCase {
    func getMovies(type: Int,  page: Int, completition: @escaping(ResponseModel) -> Void, error: @escaping(String) -> Void)
    func getMoviesSearch(search: String, completition: @escaping(ResponseModel)-> Void, error: @escaping(String) -> Void)
}

class MainInteractor {
    
    var api: ApiConnection
    var dataBase: DataBase
    var network = NetworkCheck()
    init(api: ApiConnection, dataBase: DataBase) {
        self.api = api
        self.dataBase = dataBase
    }
    
}

extension MainInteractor: MainUseCase{
    func getMoviesSearch(search: String, completition: @escaping (ResponseModel) -> Void, error: @escaping (String) -> Void) {
        
        if network.isConnected(){
            api.getMoviesSearch(search: search) { responseModel in
                completition(responseModel)
            } error: { errorDescription in
                error(errorDescription)
            }

        }else{
            
        }
        
    }
    

    func getMovies(type: Int, page: Int, completition: @escaping (ResponseModel) -> Void, error: @escaping (String) -> Void) {
        
        
        if network.isConnected(){
            api.getMovies(type: type, page: page) { responseModel in
                self.dataBase.saveMovies(result: responseModel.results)
                completition(responseModel)
            } error: { errorDescription in
                error(errorDescription)
            }
        }else{
            dataBase.getMvovies(type: type, page: page) { responseModel in
                completition(responseModel)
            }
        }
        
    }
    
    
}
