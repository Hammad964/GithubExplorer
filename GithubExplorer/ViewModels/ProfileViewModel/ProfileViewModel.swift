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

    @Published var repositories: [Repository] = [
        Repository(
            name: "hammad964/MyPortfolio",
            description: "Personal portfolio site rebuilt as a custom single-page site with Formspree contact integration.",
            language: "TypeScript",
            languageColor: .blue,
            stars: "6",
            forks: "1"
        ),

        Repository(
            name: "hammad964/ExpenseTrackerSwiftUI",
            description: "SwiftUI + SwiftData expense tracker with category breakdown charts and CloudKit sync.",
            language: "Swift",
            languageColor: .red,
            stars: "3",
            forks: "0"
        )
    ]
}
