//
//  RepositoryCardView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct RepositoryCard: View {

    let repo: Repository

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 46, height: 46)

                Text(repo.name)
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                Image(systemName: "star")
            }

            Text(repo.description)
                .foregroundColor(.gray)

            HStack(spacing: 18) {

                Circle()
                    .fill(repo.languageColor)
                    .frame(width: 10)

                Text(repo.language)

                Label(repo.stars,
                      systemImage: "star.fill")

                Label(repo.forks,
                      systemImage: "tuningfork")
            }
            .foregroundColor(.gray)
            .font(.subheadline)

        }
        .padding()
        .background(Color.githubCard)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.githubBorder, lineWidth: 1)
        )
        .cornerRadius(20)
    }
}
