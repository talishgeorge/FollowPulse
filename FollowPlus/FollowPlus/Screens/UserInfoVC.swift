//
//  UserInfoVC.swift
//  FollowPlus
//
//  Created by Talish George on 5/12/2023.
//

import UIKit

class UserInfoVC: UIViewController {

    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        print(userName)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
