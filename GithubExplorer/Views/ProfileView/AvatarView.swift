//
//  AvatarView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct AvatarView: View {

    let avatarURL: String?
    let initials: String

    var body: some View {

        Group {
            if let avatarURL, let url = URL(string: avatarURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    default:
                        initialsFallback
                    }
                }
            } else {
                initialsFallback
            }
        }
        .frame(width: 76, height: 76)
        .clipShape(Circle())
    }

    private var initialsFallback: some View {
        Circle()
            .fill(Color.githubCard)
            .overlay(
                Text(initials)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.githubSecondary)
            )
    }
}
