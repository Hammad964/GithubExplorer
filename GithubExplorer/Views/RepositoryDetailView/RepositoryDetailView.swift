//
//  RepositoryDetailView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 24/07/2026.
//

import SwiftUI

struct RepositoryDetailView: View {
    
    @State var repo: RepositoryModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                RepositoryDetailHeaderView(repo: repo)
                    .frame(maxWidth: .infinity)
                
                RepositoryStatsRowView(repo: repo)
                
                Text("DESCRIPTION")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(repo.description)
                    .foregroundColor(.githubSecondary)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.githubCard)
                    .cornerRadius(12)
                
                Text("CONTRIBUTORS")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                VStack(spacing: 0) {
                    ForEach(repo.contributors, id: \.self) { name in
                        ContributorRowView(username: name)
                    }
                }
                
                Button {
                    repo.starred.toggle()
                } label: {
                    Label(
                        repo.starred ? "Starred" : "Star this repo",
                        systemImage: repo.starred ? "star.fill" : "star"
                    )
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(repo.starred ? .black : .githubBlue)
                    .background(repo.starred ? Color.githubBlue : Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.githubBlue, lineWidth: repo.starred ? 0 : 1)
                    )
                    .cornerRadius(12)
                }
                .padding(.top, 4)
            }
            .padding()
        }
        .background(Color.githubBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RepositoryDetailView(
            repo: RepositoryModel(
                name: "gin",
                owner: "gin-gonic",
                description: "Gin is a HTTP web framework written in Go.",
                language: "Go",
                languageColor: .cyan,
                stars: "79,100",
                forks: "8,000",
                issues: "56",
                contributors: ["appleboy", "javierprovecho", "thinkerou"]
            )
        )
    }
}
