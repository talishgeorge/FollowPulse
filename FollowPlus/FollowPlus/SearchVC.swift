//
//  SearchVC.swift
//  FollowPlus
//
//  Created by Talish George on 24/11/2023.
//

import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let userNameTextField = FPTextField()
    let callToActionButton = FPButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        configureUI()
    }

    func setConstraints(
        for view: UIView,
        topAnchor: NSLayoutYAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        centerXAnchor: NSLayoutXAxisAnchor? = nil,
        heightConstant: CGFloat = 0,
        widthConstant: CGFloat = 0
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let topAnchor = topAnchor {
            view.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        }
        if let centerXAnchor = centerXAnchor {
            view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
        view.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        view.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
    }

    private func configureUI() {
        [logoImageView, userNameTextField, callToActionButton].forEach { view.addSubview($0) }
        logoImageView.image = UIImage(named: "fpLogo")!

        setConstraints(
            for: logoImageView,
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            topConstant: 80,
            centerXAnchor: view.centerXAnchor,
            heightConstant: 200,
            widthConstant: 200
        )
        setConstraints(
            for: userNameTextField,
            topAnchor: logoImageView.bottomAnchor,
            topConstant: 48,
            centerXAnchor: view.centerXAnchor,
            heightConstant: 50,
            widthConstant: view.frame.width - 100
        )
        setConstraints(
            for: callToActionButton,
            topAnchor: userNameTextField.bottomAnchor,
            topConstant: 48,
            centerXAnchor: view.centerXAnchor,
            heightConstant: 50,
            widthConstant: view.frame.width - 100
        )
    }
}

// #Preview("SearchVC") {
//    SearchVC()
// }
