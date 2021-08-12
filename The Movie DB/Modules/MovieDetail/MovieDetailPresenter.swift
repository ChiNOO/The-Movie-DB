//
//  MovieDetailPresenter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import Foundation


protocol MovieDetailPresentation {
    func showVideo(idMovie: Int)
}



class MovieDetailPresenter {
    
    var interactor: MovieDetailUseCase
    var router: MovieDetailRouting
    weak var view: MovieDetailView?
    var page = 1
    
    init(view: MovieDetailView, interactor: MovieDetailUseCase, router: MovieDetailRouting) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}


extension MovieDetailPresenter: MovieDetailPresentation{
    func showVideo(idMovie: Int) {
        router.showVideo(idMovie: idMovie)
    }
    
 
 
}
