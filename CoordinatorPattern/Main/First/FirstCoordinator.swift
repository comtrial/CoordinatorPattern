//
//  FirstCoordinator.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//

import Foundation
import UIKit


// TODO: MainCoordinator 에서 Tab 에 해당하는 Coordinator 등록해주게 되는데, 어짜피 거기서 각각 Coordinator 에서 VC 꺼내서 등록하게 되면 아래에서 lazy 로 VC 를 할당할 필요가 있나? -> 이에 대한 확인 방법 -> 속성 감시 함수나(didset 인가..), 클로저나


// 1. Coordinator 는 기본적으로 rootViewController 를 가져야 한다. (화면 전환을 고려한다면, UINavigationController)
// 2. 해당 Navigation stack 에 쌓일 ViewController 들은 lazy 를 통해 실행시에 메모리에 올라갈 수 있게 해준다.

class FirstCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    lazy var firstViewController = FirstViewController()
    
    func start() {
        self.rootViewController = UINavigationController(rootViewController: self.firstViewController)
    }
    

}
