//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//

import Foundation
import UIKit

// TODO: MainCoordinator 에서 Navigation 이 가능한 Page 를 등록할 때, NavigationViewController 가 아니라 ViewContoller 를 등록하는 이유
    // -> 중요하게 실수한 부분인 것 같아.

// TODO: self.UITabBarController 에 VC 등록하는 방법론 compare with NoCoorinatorVC
class MainCoordinator {
    var rootViewController: UITabBarController
    var childCoordinator = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
    }

    func start() {
        // MARK: setup first page
        let firstCoordinator = FirstCoordinator()
        firstCoordinator.start()
        self.childCoordinator.append(firstCoordinator)
        
            // MARK: setup TabViewController
        let firstViewController = firstCoordinator.rootViewController
        setup(vc: firstViewController, title: "first", imageName: "house")
        
        // MARK: setup second page
        let secondCoordinator = SecondCoordinator()
        secondCoordinator.start()
        self.childCoordinator.append(secondCoordinator)
        
            // MARK: setup TabViewController
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController, title: "second", imageName: "magnifyingglass.circle")
        
        //MARK: UITabBarVC set
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
        
        print("MainCoordinator setup done")
    }
    
    //MARK: set ViewController tabBarItem
    func setup(vc: UIViewController, title: String, imageName: String) {
        let defualtImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: imageName+".fill")
        let tabBarItem = UITabBarItem(title: title, image: defualtImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
