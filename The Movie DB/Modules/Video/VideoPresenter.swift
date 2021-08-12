//
//  VideoPresenter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import Foundation


protocol VideoPresentation {
    func getVideo(idMovie: Int)
    
}



class VideoPresenter {
    
    var interactor: VideoUseCase
    var router: VideoRouting
    weak var view: VideoView?
    var page = 1
    
    init(view: VideoView, interactor: VideoUseCase, router: VideoRouting) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}


extension VideoPresenter: VideoPresentation{
    func getVideo(idMovie: Int) {
        interactor.getVideo(idMovie: idMovie) { responseVideo in
            if let video = responseVideo.results.first{
                self.view?.loadVideo(key: video.key)
            }else{
                
            }
        } error: { errorDescription in
            
        }

    }
    
 
 
}
