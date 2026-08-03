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
    @Published var selectedLanguage = "All"
    @Published var allRepositories: [RepositoryModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    let languages = ["All", "Swift", "Kotlin", "TypeScript", "Python", "Go", "Rust"]

    var repositories: [RepositoryModel] {
        if selectedLanguage == "All" {
            return allRepositories
        }
        return allRepositories.filter { $0.language == selectedLanguage }
    }

    func loadTrending() async {
        guard allRepositories.isEmpty else { return }
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

    func toggleStar(id: RepositoryModel.ID) {
        if let idx = allRepositories.firstIndex(where: { $0.id == id }) {
            allRepositories[idx].starred.toggle()
        }
    }

    private func performSearch(query: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let freshResults = try await GitHubRepository.shared.searchRepositories(query: query)
            merge(freshResults)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    private func merge(_ freshResults: [RepositoryModel]) {
        let preserved = allRepositories.filter { existing in
            existing.starred && !freshResults.contains { $0.owner == existing.owner && $0.name == existing.name }
        }

        var merged = freshResults
        for repo in preserved {
            merged.append(repo)
        }
        allRepositories = merged
    }
}
