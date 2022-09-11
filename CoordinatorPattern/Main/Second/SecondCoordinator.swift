//
//  SecondCoordinator.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/09.
//

import Foundation
import UIKit

class SecondCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    lazy var secondViewController = SecondViewController()
    
    func start() {
        self.rootViewController = UINavigationController(rootViewController: self.secondViewController)
    }
}
