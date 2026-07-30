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
        }
    }
}
