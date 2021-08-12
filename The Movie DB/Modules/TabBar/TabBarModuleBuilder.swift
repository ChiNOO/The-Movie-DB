//
//  TabBarModuleBuilder.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 05/08/21.
//

import UIKit
import Foundation

class TabBarModuleBuilder {


    static func build() -> UITabBarController {
        
        let submodules = (
            pop: MainModuleBuilder.build(usingNavigationFactory: NavigationBuilder.build, type: 1),
            topRated: MainModuleBuilder.build(usingNavigationFactory: NavigationBuilder.build, type: 2),
            upComing: MainModuleBuilder.build(usingNavigationFactory: NavigationBuilder.build, type: 3)
        )
        
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let tabBarController = TabBarController(tabs: tabs)
        /*tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .darkGray*/

      //  let presenter = TabBarPresenter(view: tabBarController)

       // presenter.view = tabBarController
       // tabBarController.tabBar.tintColor = UIColor.primary
        return tabBarController
                
    }
}
