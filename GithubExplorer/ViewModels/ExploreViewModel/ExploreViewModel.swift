//
//  ExploreViewModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI
import Combine

class ExploreViewModel: ObservableObject {

    @Published var searchText = ""
    @Published var selectedLanguage = "All"

    let languages = [
        "All",
        "Swift",
        "Kotlin",
        "TypeScript",
        "Python",
        "Go",
        "Rust"
    ]

    @Published var repositories: [RepositoryModel] = [
        RepositoryModel(
            name: "gin-gonic/gin",
            owner: "gin-gonic",
            description: "Gin is a HTTP web framework written in Go.",
            language: "Go",
            languageColor: .cyan,
            stars: "79,100",
            forks: "8,000",
            issues: "56",
            contributors: ["appleboy", "javierprovecho", "thinkerou"]
        )
    ]
}
