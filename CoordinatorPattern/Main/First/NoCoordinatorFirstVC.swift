//
//  NoCoordinatorFirstVC.swift
//  CoordinatorPattern
//
//  Created by 최승원 on 2022/09/08.
//

import Foundation
import UIKit

class NoCoordinatorFirstVC: UIViewController{
    private var text: UILabel = UILabel()
    private var button: UIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        confifureUI()
    }
    
    func confifureUI() {
        view.backgroundColor = .white
        // MARK: addsubview 를 먼저 하지 않으면 아래의 text의 constrain 를 등록할 때 에러난다.
        view.addSubview(text)
        view.addSubview(button)
        
        // MARK: No StoryBoard setup
        button.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false

        // MARK: UI Component attribute setup
        text.text = "First"
        
        button.setTitle("Move to detail pagee", for: .normal)
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
        print("click")
        // MARK: setup page router
        let detailViewController = DetailViewController()
        // MARK: push to page
        if let _: UINavigationController = self.navigationController {
            print("success to unwrapping nvc")
        } else {
            print("can not unwrapping nvc")
        }
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
