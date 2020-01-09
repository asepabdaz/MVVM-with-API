//
//  AppCoordinator.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
