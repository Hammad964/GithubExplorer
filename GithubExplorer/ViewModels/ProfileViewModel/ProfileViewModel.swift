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
        for repo in repos {
            let alreadyExists = exploreVM.allRepositories.contains {
                $0.owner == repo.owner && $0.name == repo.name
            }
            if !alreadyExists {
                exploreVM.allRepositories.append(repo)
            }
        }
    }
}
