//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/09.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    private var button: UIButton = UIButton()
    private var text: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(text)
        view.addSubview(button)
        
        // MARK: No StoryBoard setup
        button.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false

        // MARK: UI Component attribute setup
        text.text = "Second"
        
        button.setTitle("Move to detail page", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        button.backgroundColor = .systemBlue

        // MARK: UI Component Layout setup
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    @objc private func buttonPressed(_: UIButton) {
        if let nvc: UINavigationController = self.navigationController {
            print("nvc unwrapping success")
            
            // TODO: 아래에서 DetailCoordinator 를 등록하고 start 걸어주고 push 해주는 과정이 어색하다,.
            // -> Coordinator 사용법이 아예 틀렸음
            let coordinator = DetailCoordinator()
//            if let _: DetailCoordinator = coordinator{
//                print("coord unwrapping succ")
//            } else {
//                print("coord unwrap fail")
//            }
            
            coordinator.start()
            coordinator.pushToDetail(navigationController: nvc)
        } else {
            
            print("nvc unwrapping failed")
            return
            
        }
    }
}
