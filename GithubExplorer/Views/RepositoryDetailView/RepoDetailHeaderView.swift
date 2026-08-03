//
//  RepoDetailHeaderView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

struct RepositoryDetailHeaderView: View {

    let repo: RepositoryModel

    var body: some View {
        VStack(spacing: 10) {

            AsyncImage(url: URL(string: repo.avatarURL ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Color.gray.opacity(0.2)
                case .empty:
                    ProgressView()
                @unknown default:
                    Color.gray.opacity(0.2)
                }
            }
            .frame(width: 56, height: 56)
            .clipShape(RoundedRectangle(cornerRadius: 14))

            Text(repo.name)
                .font(.title3.bold())
                .foregroundColor(.white)

            Text(repo.owner)
                .font(.subheadline)
                .foregroundColor(.githubSecondary)
        }
        .padding(.top, 8)
        .padding(.bottom, 18)
    }
}
