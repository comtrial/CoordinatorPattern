//
//  SceneDelegate.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowscene = scene as? UIWindowScene {
          
            let window = UIWindow(windowScene: windowscene)
            
            let mainCoordinator = MainCoordinator()
            mainCoordinator.start()
            window.rootViewController = mainCoordinator.rootViewController
            
            
            //for NoCoor window.rootViewController = NoCoordinatorVC()
            
            self.window = window
            window.makeKeyAndVisible()
            
        } else { return }
    }

}

