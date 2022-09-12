//
//  FirstViewController.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/09.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    private var text: UILabel = UILabel()
    private var button: UIButton = UIButton()
    
    // TODO: 내 생각엔 VC 가 Coordinator 를 가지고 있는 모양이 어색하다고 생각하는데 좀더 알아봐주라
    lazy var coordinator = DetailCoordinator()
    
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
        text.text = "First"
        
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
            print("nvc unwrapping successddd")
            // TODO: 아래에서 DetailCoordinator 를 등록하고 start 걸어주고 push 해주는 과정이 어색하다,.
            coordinator.pushToDetail(navigationController: nvc)
        } else {
            print("nvc unwrapping failed")
            return
        }
    }
}
