//
//  NoCoordinatorVC.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//
import UIKit

class NoCoordinatorVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    init() {
        // TODO: 왜 아래 로직이 필요한지
        super.init(nibName: nil, bundle: nil)
        
        let firstNavigationVC = UINavigationController(rootViewController: NoCoordinatorFirstVC())
        let firstTabVC: UINavigationController = firstNavigationVC
        
        // MARK: 아래 주석 처럼 하면 navigation stack 이 생성이 안되기에 button click 에서 self.navigationController?.push... 하는데 self.navigationController 자체가 unwrapping 이 안됨
//        let firstTabVC: UIViewController = NoCoordinatorFirstVC()
        setup(vc: firstTabVC, title: "first", imageName: "house")
        
        let secondeTabVC: UIViewController = NoCoordinatorSecondVC()
        setup(vc: secondeTabVC, title: "first", imageName: "magnifyingglass.circle")
        
        self.viewControllers = [firstTabVC, secondeTabVC]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setup VC tabBarItem
    func setup(vc: UIViewController, title: String, imageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: imageName + ".fill")
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        
        vc.tabBarItem = tabBarItem
    }
}

