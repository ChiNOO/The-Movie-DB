//
//  NavigationBuilder.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 05/08/21.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {

    static func build(rootView: UIViewController) -> UINavigationController{
        
        let navigationController = UINavigationController(rootViewController: rootView)
        
        /*navigationController.navigationBar.barTintColor = UIColor.primary
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.barTintColor = UIColor.white*/
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.tintColor = UIColor.orange
        //navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        //navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false

        //navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
