//
//  User.swift
//  FollowPlus
//
//  Created by Talish George on 2/12/2023.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarurl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmUrl: String
    var followers: Int
    var createdAt: String
}
