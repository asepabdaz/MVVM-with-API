//
//  FavoriteCoordinator.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class FavoriteCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieViewController()
        let favoritesBarButton = UITabBarItem(title: "Favorites", image: UIImage(named: "heartActive"), tag: 0)
        vc.tabBarItem  = favoritesBarButton
        vc.coordinator2  = self
        vc.title = "Movie Lover"
        navigationController.pushViewController(vc, animated: true)
    }
}
