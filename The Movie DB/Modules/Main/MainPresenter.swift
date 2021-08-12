//
//  MainPresenter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import Foundation


protocol MainPresentation {
    func getMovies(type: Int)
    func showDetail(movie: MovieModel)
    func getMoviesSearch(search: String)
}



class MainPresenter {
    
    var interactor: MainUseCase
    var router: MainRouting
    weak var view: MainView?
    var page = 1
    
    init(view: MainView, interactor: MainUseCase, router: MainRouting) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}


extension MainPresenter: MainPresentation{
    
    func getMoviesSearch(search: String) {
        interactor.getMoviesSearch(search: search) { responseModel in
            if responseModel.results.count > 0{
                self.view?.loadMovies(result: responseModel.results)
            }
        } error: { errorDescription in
            
        }

    }
    
    
 
    
    func getMovies(type: Int) {
        
        self.interactor.getMovies(type: type, page: page) { responseModel in
            self.view?.loadMovies(result: responseModel.results)
        } error: { errorDescription in
            self.view?.error(description: errorDescription)
        }

    }
    
    
    func showDetail(movie: MovieModel) {
        self.router.showDetail(movie: movie)
    }
    
    
}
