//
//  MovieDetailBuilder.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 11/08/21.
//

import UIKit

class MovieDetailBuilder {
    
    static func build(movie: MovieModel) -> UIViewController{
        let storyboard = UIStoryboard.init(name: "MovieDetail", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        view.movie = movie
        let interactor = MovieDetailInteractor(api: ApiConnection.shared, dataBase: DataBase.shared)
        let router = MovieDetailRouter(view: view)
        let presenter = MovieDetailPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
    
}
