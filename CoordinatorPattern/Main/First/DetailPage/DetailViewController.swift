//
//  DetailViewController.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        confifureUI()
    }
    
    func confifureUI() {
        view.backgroundColor = .white
        
        let text = UILabel()
        text.text = "Detail"
        // MARK: addsubview 를 먼저 하지 않으면 아래의 text의 constrain 를 등록할 때 에러난다.
        view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
}
