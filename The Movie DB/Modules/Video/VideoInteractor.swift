//
//  VideoInteractor.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import Foundation

protocol VideoUseCase {
    func getVideo(idMovie: Int, completition: @escaping(ResponseVideoModel) -> Void, error: @escaping(String) -> Void)
    
}

class VideoInteractor {
    
    var api: ApiConnection
    var dataBase: DataBase
    var network = NetworkCheck()
    
    init(api: ApiConnection, dataBase: DataBase) {
        self.api = api
        self.dataBase = dataBase
    }
    
}

extension VideoInteractor: VideoUseCase{
 
    func getVideo(idMovie: Int, completition: @escaping (ResponseVideoModel) -> Void, error: @escaping (String) -> Void) {
        
        if network.isConnected(){
            api.getMovieVideo(idMovie: idMovie) { responseVideo in
                self.dataBase.saveVideo(video: responseVideo)
                completition(responseVideo)
            } error: { errorDescription in
                
            }

        }else{
            dataBase.getMovieVideo(idMovie: idMovie) { responseModel in
                completition(responseModel)
            } error: { errorDescription in
                
            }
        }
        
    }
    
   
    
    
}
