//
//  MovieDetailInteractor.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import Foundation

protocol MovieDetailUseCase {
    
}

class MovieDetailInteractor {
    
    var api: ApiConnection
    var dataBase: DataBase
    var network = NetworkCheck()
    
    init(api: ApiConnection, dataBase: DataBase) {
        self.api = api
        self.dataBase = dataBase
    }
    
}

extension MovieDetailInteractor: MovieDetailUseCase{
 
 
    
}
