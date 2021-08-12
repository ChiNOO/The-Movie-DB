//
//  TabBarController.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 03/08/21.
//

import UIKit

typealias MoviesTabs = (
    pop: UIViewController,
    topRated: UIViewController,
    upComing: UIViewController
)



protocol TabBarView: AnyObject {
    
}

class TabBarController: UITabBarController {

    init(tabs: MoviesTabs){
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.pop, tabs.topRated, tabs.upComing]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TabBarController: TabBarView{
    
}
