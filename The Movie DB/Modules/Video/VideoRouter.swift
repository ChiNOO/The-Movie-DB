//
//  VideoRouter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 12/08/21.
//

import UIKit

protocol VideoRouting {
    
}

class VideoRouter {
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension VideoRouter: VideoRouting{
   
    
}
