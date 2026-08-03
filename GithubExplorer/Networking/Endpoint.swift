//
//  Endpoint.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import Foundation

enum Endpoint {
    case searchRepositories(query: String)
    case contributors(owner: String, repo: String)
    case user(username: String)
    case userRepos(username: String)

    private var baseURL: String { "https://api.github.com" }

    var url: URL? {
        switch self {
        case .searchRepositories(let query):
            var components = URLComponents(string: "\(baseURL)/search/repositories")
            components?.queryItems = [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "order", value: "desc")
            ]
            return components?.url

        case .contributors(let owner, let repo):
            return URL(string: "\(baseURL)/repos/\(owner)/\(repo)/contributors")

        case .user(let username):
            return URL(string: "\(baseURL)/users/\(username)")

        case .userRepos(let username):
            var components = URLComponents(string: "\(baseURL)/users/\(username)/repos")
            components?.queryItems = [URLQueryItem(name: "sort", value: "updated")]
            return components?.url
        }
    }
}
