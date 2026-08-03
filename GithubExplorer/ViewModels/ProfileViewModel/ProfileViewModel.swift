//
//  ProfileViewModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 24/07/2026.
//

import SwiftUI
import Combine

import SwiftUI
import Combine

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var user: GitHubUser?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadProfile(username: String, into exploreVM: ExploreViewModel) async {
        isLoading = true
        errorMessage = nil
        do {
            let result = try await GitHubRepository.shared.fetchProfile(username: username)
            user = result.user
            merge(result.repos, into: exploreVM)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    private func merge(_ repos: [RepositoryModel], into exploreVM: ExploreViewModel) {
        let existingIDs = Set(exploreVM.allRepositories.map { $0.id })
        let newRepos = repos.filter { !existingIDs.contains($0.id) }
        exploreVM.allRepositories.append(contentsOf: newRepos)
    }
}
