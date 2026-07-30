//
//  ExploreViewModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI
import Combine

@MainActor
class ExploreViewModel: ObservableObject {

    @Published var searchText = ""
    @Published var selectedLanguage = "All" {
        didSet {
            print("🔽 [ExploreViewModel] Language filter changed to: \(selectedLanguage)")
        }
    }
    @Published var allRepositories: [RepositoryModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    let languages = ["All", "Swift", "Kotlin", "TypeScript", "Python", "Go", "Rust"]

    // Views should read THIS, not allRepositories
    var repositories: [RepositoryModel] {
        if selectedLanguage == "All" {
            return allRepositories
        }
        return allRepositories.filter { $0.language == selectedLanguage }
    }

    func loadTrending() async {
        await performSearch(query: "stars:>10000")
    }

    func search() async {
        let trimmed = searchText.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {
            await loadTrending()
            return
        }
        await performSearch(query: trimmed)
    }

    private func performSearch(query: String) async {
        isLoading = true
        errorMessage = nil
        do {
            allRepositories = try await GitHubRepository.shared.searchRepositories(query: query)
            print("✅ [ExploreViewModel] Loaded \(allRepositories.count) repositories")
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
