//
//  ProfileViewModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 24/07/2026.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {

    @Published var user = GitHubUser(
        initials: "HA",
        name: "Hammad Ahmed",
        username: "hammad964",
        bio: "iOS Developer · Swift, SwiftUI, MVVM",
        repositories: 12,
        followers: 34,
        following: 28
    )

    @Published var repositories: [RepositoryModel] = [
        RepositoryModel(
            name: "hammad964/MyPortfolio",
            owner: "gin-gonic",
            description: "Personal portfolio site rebuilt as a custom single-page site with Formspree contact integration.",
            language: "TypeScript",
            languageColor: .blue,
            stars: "6",
            forks: "1",
            issues: "56",
            contributors: ["appleboy", "javierprovecho", "thinkerou"]
        ),

        RepositoryModel(
            name: "hammad964/ExpenseTrackerSwiftUI",
            owner: "gin-gonic",
            description: "SwiftUI + SwiftData expense tracker with category breakdown charts and CloudKit sync.",
            language: "Swift",
            languageColor: .red,
            stars: "3",
            forks: "0",
            issues: "56",
            contributors: ["appleboy", "javierprovecho", "thinkerou"]
        )
    ]
}
