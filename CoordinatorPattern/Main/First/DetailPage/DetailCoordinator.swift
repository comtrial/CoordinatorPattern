//
//  DetailCoordinator.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/09.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    lazy var rootViewController = DetailViewController()
    
    func start() {
        self.rootViewController = DetailViewController()
    }
    
    // MARK: extension 으로 구현해도 되는 것 같아,
    // MARK: 해당 Coordinator 가 가지고 있는 VC 로 화면 전환 시켜주는 메서드
    func pushToDetail(navigationController: UINavigationController) {
        print("push func did load")
        navigationController.pushViewController(DetailViewController(), animated: true)
    }
}
