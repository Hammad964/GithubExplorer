//
//  NetworkError.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case rateLimited
    case decodingFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "Unexpected response from server."
        case .rateLimited:
            return "GitHub rate limit reached. Try again in a few minutes."
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}
