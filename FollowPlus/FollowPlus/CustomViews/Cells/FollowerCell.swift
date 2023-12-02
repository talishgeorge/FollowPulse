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
    let userNameLabel = FPTitleLable(textAlignment: .center, fontSize: 16)
    var avatarImageViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
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
    
    private func configure() {
        addSubview(avatraImageView)
        addSubview(userNameLabel)
        let padding: CGFloat = 0
//        let itemWidth = (contentView.frame.size.width - 2 * padding)
        avatarImageViewHeightConstraint = avatraImageView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            avatraImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatraImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            avatraImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageViewHeightConstraint!,
            //avatraImageView.heightAnchor.constraint(equalTo: avatraImageView.widthAnchor),
//            avatraImageView.heightAnchor.constraint(equalToConstant: itemWidth),
            userNameLabel.topAnchor.constraint(equalTo: avatraImageView.bottomAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
