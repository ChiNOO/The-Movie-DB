//
//  MainModuleBuilder.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 05/08/21.
//

import UIKit

class MainModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory, type: Int) -> UIViewController{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        view.type = type
        let interactor = MainInteractor(api: ApiConnection.shared, dataBase: DataBase.shared)
        let router = MainRouter(view: view)
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return factory(view)
    }
    
}
