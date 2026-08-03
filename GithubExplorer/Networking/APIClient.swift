//
//  APIClient.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import Foundation

final class APIClient {

    static let shared = APIClient()
    private init() {}

    private func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            print("❌ [APIClient] Invalid URL for endpoint: \(endpoint)")
            throw NetworkError.invalidURL
        }

        print("➡️ [APIClient] Requesting: \(url.absoluteString)")

        let data: Data
        let response: URLResponse

        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            print("❌ [APIClient] Request failed: \(error.localizedDescription)")
            throw NetworkError.requestFailed(error)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            print("❌ [APIClient] Response was not HTTPURLResponse")
            throw NetworkError.invalidResponse
        }

        print("⬅️ [APIClient] Status code: \(httpResponse.statusCode)")

        if let rawString = String(data: data, encoding: .utf8) {
            print("📦 [APIClient] Raw response (first 500 chars):")
            print(String(rawString.prefix(500)))
        }

        if httpResponse.statusCode == 403 {
            print("⚠️ [APIClient] Rate limited by GitHub.")
            throw NetworkError.rateLimited
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            print("❌ [APIClient] Bad status code: \(httpResponse.statusCode)")
            throw NetworkError.invalidResponse
        }

        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            print("✅ [APIClient] Decoded successfully as \(T.self)")
            return decoded
        } catch {
            print("❌ [APIClient] Decoding failed: \(error)")
            throw NetworkError.decodingFailed(error)
        }
    }

    func searchRepositories(query: String) async throws -> [RepositoryDTO] {
        let response: SearchResponse = try await fetch(.searchRepositories(query: query))
        return response.items
    }

    func fetchContributors(owner: String, repo: String) async throws -> [ContributorDTO] {
        try await fetch(.contributors(owner: owner, repo: repo))
    }
    
    func fetchUser(username: String) async throws -> UserDTO {
        try await fetch(.user(username: username))
    }

    func fetchUserRepos(username: String) async throws -> [RepositoryDTO] {
        try await fetch(.userRepos(username: username))
    }
}
