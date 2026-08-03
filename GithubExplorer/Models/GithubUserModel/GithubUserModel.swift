//
//  GithubUserModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import Foundation

struct GitHubUser {
    let name: String
    let username: String
    let bio: String
    let avatarURL: String?

    let repositories: Int
    let followers: Int
    let following: Int

    var initials: String {
        let parts = name.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first }
        return String(letters).uppercased()
    }
}
