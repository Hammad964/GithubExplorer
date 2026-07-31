//
//  RepositoryCardView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct RepositoryCardView: View {

    let repo: RepositoryModel
    let onToggleStar: () -> Void

    var body: some View {

        HStack(alignment: .top, spacing: 12) {

            AsyncImage(url: URL(string: repo.avatarURL ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    Color.gray.opacity(0.2)
                case .empty:
                    ProgressView()
                @unknown default:
                    Color.gray.opacity(0.2)
                }
            }
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text("\(repo.owner)/\(repo.name)")
                    .font(.subheadline.bold())
                    .foregroundColor(.white)

                Text(repo.description)
                    .font(.caption)
                    .foregroundColor(.githubSecondary)
                    .lineLimit(2)

                HStack(spacing: 12) {
                    Label(repo.stars, systemImage: "star.fill")
                    Label(repo.forks, systemImage: "arrow.triangle.branch")
                }
                .font(.caption2)
                .foregroundColor(.githubSecondary)
            }

            Spacer()

            Button(action: onToggleStar) {
                Image(systemName: repo.starred ? "star.fill" : "star")
                    .foregroundColor(repo.starred ? .yellow : .githubSecondary)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.githubCard)
        .cornerRadius(12)
    }
}

//#Preview {
//    RepositoryCardView(
//        repo: RepositoryModel(
//            name: "gin",
//            owner: "gin-gonic",
//            avatarURL: "https://avatars.githubusercontent.com/u/7894478?v=4",
//            description: "Gin is a HTTP web framework written in Go.",
//            language: "Go",
//            languageColor: .cyan,
//            stars: "79,100",
//            forks: "8,000",
//            issues: "56",
//            contributors: []
//        ), onToggleStar:
//    )
//    .padding()
//    .background(Color.githubBackground)
//}
