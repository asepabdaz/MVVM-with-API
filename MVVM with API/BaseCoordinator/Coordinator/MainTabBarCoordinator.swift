//
//  MainTabBarCoordinator.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class MainTabBarCoordinator: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    let favorite = FavoriteCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        favorite.start()
        viewControllers = [main.navigationController, favorite.navigationController]
    }
}
