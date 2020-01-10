//
//  MainCoordinator.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieViewController()
        vc.tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "listDeactive"), selectedImage: UIImage(named: "listActive"))
        vc.coordinator = self
        vc.viewModel.fetchMovieList()
        vc.title = "Movie Lover"
        navigationController.pushViewController(vc, animated: false)
    }
    
    func detailCollectionView(model: DetailMovieViewModel){
        let vc = DetailMovieViewController()
        vc.viewModel = model
        vc.title = "Movie Lover"
        navigationController.pushViewController(vc, animated: true)
    }
}
