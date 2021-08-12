//
//  MainRouter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import UIKit

protocol MainRouting {
    func showDetail(movie: MovieModel)
}

class MainRouter {
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension MainRouter: MainRouting{
    
    func showDetail(movie: MovieModel) {
        let viewController = MovieDetailBuilder.build(movie: movie)
        //view.present(viewController, animated: true, completion: nil)
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
