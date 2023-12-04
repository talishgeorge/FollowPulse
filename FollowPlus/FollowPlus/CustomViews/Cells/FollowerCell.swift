//
//  FollowerCell.swift
//  FollowPlus
//
//  Created by Talish George on 2/12/2023.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"

    let avatraImageView = FPAvatraImageIvew(frame: .zero)
    let userNameLabel = FPTitleLabel(textAlignment: .center, fontSize: 16)
    var avatarImageViewHeightConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        avatarImageViewHeightConstraint = avatraImageView.heightAnchor.constraint(equalTo: avatraImageView.widthAnchor)
        avatarImageViewHeightConstraint?.isActive = true
        // contentView.backgroundColor = .lightGray // Set the background color here
        avatraImageView.backgroundColor = .lightGray // Set a contrasting color for the image view
        userNameLabel.backgroundColor = .lightText // Set a contrasting color for the label
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let itemWidth = contentView.frame.size.width
        avatarImageViewHeightConstraint?.constant = itemWidth
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }

    func set(follower: Follower) {
        userNameLabel.text = follower.login
    }

    /// <#Description#>
    private func configure() {
        contentView.addSubview(avatraImageView)
        contentView.addSubview(userNameLabel)
        let padding: CGFloat = 0
        avatraImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.numberOfLines = 1 // Allow label to grow vertically

        NSLayoutConstraint.activate([
            avatraImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatraImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatraImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatraImageView.heightAnchor.constraint(equalTo: avatraImageView.widthAnchor), // Make height equal to width

            userNameLabel.topAnchor.constraint(equalTo: avatraImageView.bottomAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }
}
