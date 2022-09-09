//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/09.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        let text = UILabel()
        text.text = "Second"
        // MARK: addsubview 를 먼저 하지 않으면 아래의 text의 constrain 를 등록할 때 에러난다.
        view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}