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
        callToActionButton.addTarget(self, action: #selector(pushFollolwerList), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
//        self.title = "Search"
        configureUI()
    }

    @objc private func pushFollolwerList() {
        let follolwerListVC = FollowersListVC()
        follolwerListVC.userName = userNameTextField.text ?? "Talish"
        follolwerListVC.title = userNameTextField.text ?? "Talish"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(follolwerListVC, animated: true)
    }

    private func createDismissKeyboradTapGestures() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
//        logoContainerView.backgroundColor = .orange
//        userNameContainerView.backgroundColor = .yellow
//        callToActionContainerView.backgroundColor = .brown

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

        if subview is UITextField {
            userNameTextField.delegate = self
            userNameTextField.text = "Talish"
        }

        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding.top),
            subview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding.left),
            subview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding.right),
            subview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding.bottom),
        ])

        return containerView
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollolwerList()
        return true
    }
}

#Preview("SearchVC") {
    SearchVC()
}
