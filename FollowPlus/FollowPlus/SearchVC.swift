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

    private func configureUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        logoImageView.image = UIImage(named: "fpLogo")!
        logoImageView.contentMode = .scaleAspectFit

        let logoContainerView = createContainerView(
            for: logoImageView,
            padding: UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 200,
                right: 10
            )
        )
        let userNameContainerView = createContainerView(
            for: userNameTextField,
            padding: UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 100,
                right: 10
            )
        )
        let callToActionContainerView = createContainerView(
            for: callToActionButton,
            padding: UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
        )
        logoContainerView.backgroundColor = .orange
        userNameContainerView.backgroundColor = .yellow
        callToActionContainerView.backgroundColor = .brown

        stackView.addArrangedSubview(logoContainerView)
        stackView.addArrangedSubview(userNameContainerView)
        stackView.addArrangedSubview(callToActionContainerView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func createContainerView(for subview: UIView, padding: UIEdgeInsets) -> UIView {
        let containerView = UIView()
        containerView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding.top),
            subview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding.left),
            subview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding.right),
            subview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding.bottom),
        ])

        return containerView
    }
    /* private func configureUI() {
             let spacerView0 = UIView()
             //spacerView0.backgroundColor = .red
             let spacerView1 = UIView()
             //spacerView1.backgroundColor = .yellow
             let spacerView2 = UIView()
             //spacerView2.backgroundColor = .orange
     //        spacerView0.heightAnchor.constraint(equalToConstant: 100).isActive = true
     //        spacerView1.heightAnchor.constraint(equalToConstant: 0).isActive = true
     //        spacerView2.heightAnchor.constraint(equalToConstant: 300).isActive = true

     //        let stackView = UIStackView(arrangedSubviews: [spacerView0, logoImageView, spacerView1, userNameTextField, spacerView2, callToActionButton])
             let stackView = UIStackView(arrangedSubviews: [ logoImageView,  userNameTextField, callToActionButton])
             stackView.axis = .vertical
             stackView.distribution = .fill
             stackView.spacing = 20

             view.addSubview(stackView)
             stackView.translatesAutoresizingMaskIntoConstraints = false
             logoImageView.image = UIImage(named: "fpLogo")!
             logoImageView.contentMode = .scaleAspectFit
             NSLayoutConstraint.activate([
                 stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                 stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                 stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                 stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                 logoImageView.heightAnchor.constraint(equalToConstant: 200),
                 logoImageView.widthAnchor.constraint(equalToConstant: 200),
                 userNameTextField.heightAnchor.constraint(equalToConstant: 50),
                 callToActionButton.heightAnchor.constraint(equalToConstant: 50),
             ])
         }*/

//    private func configureUI() {
//        let spacerView = UIView()
//        let stackView = UIStackView(arrangedSubviews: [logoImageView, userNameTextField, spacerView, callToActionButton])
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.spacing = 20
//
//        view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        logoImageView.image = UIImage(named: "fpLogo")!
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
//            logoImageView.heightAnchor.constraint(equalToConstant: 200),
//            logoImageView.widthAnchor.constraint(equalToConstant: 200),
//            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
//            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
//        ])
//    }

//    private func configureUI() {
//        let stackView = UIStackView(arrangedSubviews: [logoImageView, userNameTextField, callToActionButton])
//        stackView.axis = .vertical
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 20
//
//        view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        logoImageView.image = UIImage(named: "fpLogo")!
//        NSLayoutConstraint.activate(
//            [
//                stackView.topAnchor.constraint(
//                    equalTo: view.safeAreaLayoutGuide.topAnchor,
//                    constant: 80
//                ),
//                stackView.leadingAnchor.constraint(
//                    equalTo: view.leadingAnchor,
//                    constant: 50
//                ),
//                stackView.trailingAnchor.constraint(
//                    equalTo: view.trailingAnchor,
//                    constant: -50
//                ),
//                logoImageView.heightAnchor.constraint(equalToConstant: 200),
//                logoImageView.widthAnchor.constraint(equalToConstant: 200),
//                userNameTextField.heightAnchor.constraint(equalToConstant: 50),
//                callToActionButton.heightAnchor.constraint(equalToConstant: 50),
//            ]
//        )
//    }

//    func setConstraints(
//        for view: UIView,
//        topAnchor: NSLayoutYAxisAnchor? = nil,
//        topConstant: CGFloat = 0,
//        centerXAnchor: NSLayoutXAxisAnchor? = nil,
//        heightConstant: CGFloat = 0,
//        widthConstant: CGFloat = 0
//    ) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        if let topAnchor = topAnchor {
//            view.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
//        }
//        if let centerXAnchor = centerXAnchor {
//            view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        }
//        view.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
//        view.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
//    }
//
//    private func configureUI() {
//        [logoImageView, userNameTextField, callToActionButton].forEach { view.addSubview($0) }
//        logoImageView.image = UIImage(named: "fpLogo")!
//
//        setConstraints(
//            for: logoImageView,
//            topAnchor: view.safeAreaLayoutGuide.topAnchor,
//            topConstant: 80,
//            centerXAnchor: view.centerXAnchor,
//            heightConstant: 200,
//            widthConstant: 200
//        )
//        setConstraints(
//            for: userNameTextField,
//            topAnchor: logoImageView.bottomAnchor,
//            topConstant: 48,
//            centerXAnchor: view.centerXAnchor,
//            heightConstant: 50,
//            widthConstant: view.frame.width - 100
//        )
//        setConstraints(
//            for: callToActionButton,
//            topAnchor: userNameTextField.bottomAnchor,
//            topConstant: 48,
//            centerXAnchor: view.centerXAnchor,
//            heightConstant: 50,
//            widthConstant: view.frame.width - 100
//        )
//    }
}

#Preview("SearchVC") {
    SearchVC()
}
