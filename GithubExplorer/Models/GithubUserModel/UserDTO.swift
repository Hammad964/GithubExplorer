//
//  UserDTO.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 03/08/2026.
//

import Foundation

struct UserDTO: Decodable {
    let login: String
    let name: String?
    let bio: String?
    let avatarUrl: String
    let publicRepos: Int
    let followers: Int
    let following: Int

    enum CodingKeys: String, CodingKey {
        case login, name, bio
        case avatarUrl = "avatar_url"
        case publicRepos = "public_repos"
        case followers, following
    }
}
