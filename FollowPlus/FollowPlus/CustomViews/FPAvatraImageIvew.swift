//
//  FPAvatraImageIvew.swift
//  FollowPlus
//
//  Created by Talish George on 2/12/2023.
//

import UIKit

class FPAvatraImageIvew: UIImageView {
    let placeholderImage = #imageLiteral(resourceName: "avatar-paceholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
