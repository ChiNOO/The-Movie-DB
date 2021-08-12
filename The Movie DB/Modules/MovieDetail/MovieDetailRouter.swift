//
//  MovieDetailRouter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import UIKit

protocol MovieDetailRouting {
    func showVideo(idMovie: Int)
}

class MovieDetailRouter {
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension MovieDetailRouter: MovieDetailRouting{
    
    
    func showVideo(idMovie: Int) {
        let viewController = VideoModuleBuilder.build(id: idMovie)
        view.navigationController?.pushViewController(viewController, animated: true)
    }

    
}
