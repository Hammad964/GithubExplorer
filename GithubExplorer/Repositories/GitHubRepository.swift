//
//  GitHubRepository.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import Foundation

final class GitHubRepository {
    
    static let shared = GitHubRepository()
    private init() {}
    
    func searchRepositories(query: String) async throws -> [RepositoryModel] {
        let dtos = try await APIClient.shared.searchRepositories(query: query)
        return dtos.map(map)
    }
    
    func fetchContributors(owner: String, repo: String) async throws -> [String] {
        let dtos = try await APIClient.shared.fetchContributors(owner: owner, repo: repo)
        return dtos.map { $0.login }
    }
    
    private func map(_ dto: RepositoryDTO) -> RepositoryModel {
        RepositoryModel(
            id: dto.id,
            name: dto.name,
            owner: dto.owner.login,
            avatarURL: dto.owner.avatarUrl,
            description: dto.description ?? "No description provided.",
            language: dto.language ?? "Unknown",
            languageColor: LanguageColorMap.color(for: dto.language),
            stars: dto.stargazersCount.formatted(),
            forks: dto.forksCount.formatted(),
            issues: dto.openIssuesCount.formatted(),
            contributors: []
        )
    }
    
    func fetchProfile(username: String) async throws -> (user: GitHubUser, repos: [RepositoryModel]) {
        async let userDTO = APIClient.shared.fetchUser(username: username)
        async let repoDTOs = APIClient.shared.fetchUserRepos(username: username)

        let (fetchedUser, fetchedRepos) = try await (userDTO, repoDTOs)

        let user = GitHubUser(
            name: fetchedUser.name ?? fetchedUser.login,
            username: fetchedUser.login,
            bio: fetchedUser.bio ?? "",
            avatarURL: fetchedUser.avatarUrl,
            repositories: fetchedUser.publicRepos,
            followers: fetchedUser.followers,
            following: fetchedUser.following
        )

        let repos = fetchedRepos.map(map)
        return (user, repos)
    }
}
