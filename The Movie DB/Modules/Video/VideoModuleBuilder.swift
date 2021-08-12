//
//  VideoModuleBuilder.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 11/08/21.
//

import Foundation
import UIKit

class VideoModuleBuilder {
    
    static func build(id: Int) -> UIViewController{
        let storyboard = UIStoryboard.init(name: "Video", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "VideoViewController") as! VideoViewController
        view.id = id
        let interactor = VideoInteractor(api: ApiConnection.shared, dataBase: DataBase.shared)
        let router = VideoRouter(view: view)
        let presenter = VideoPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
    
}
