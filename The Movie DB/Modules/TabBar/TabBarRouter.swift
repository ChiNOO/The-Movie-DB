//
//  TabBarRouter.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 05/08/21.
//

import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    var subModules: SubModules
    
    typealias SubModules = (
        pop: UIViewController,
        topRated: UIViewController,
        upComing: UIViewController
    )
    
    init(viewController: UIViewController, subModules: SubModules) {
        self.viewController = viewController
        self.subModules = subModules
    }
}

extension TabBarRouter{
    static func tabs(usingSubmodules submodules: SubModules) -> MoviesTabs{
        let popTabBarItem = UITabBarItem(title: "Populares", image: UIImage(named: "img_home"), tag: 11)
        let topRatedTabBarItem = UITabBarItem(title: "Top Rated", image: UIImage(named: "img_categories"), tag: 12)
        let upComingTabBarItem = UITabBarItem(title: "Up Coming", image: UIImage(named: "img_orders"), tag: 13)
        
        submodules.pop.tabBarItem = popTabBarItem
        submodules.topRated.tabBarItem = topRatedTabBarItem
        submodules.upComing.tabBarItem = upComingTabBarItem
        
        return (
            pop: submodules.pop,
            topRated: submodules.topRated,
            upComing: submodules.upComing
        )
    }
}
