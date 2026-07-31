//
//  RepositoryDetailView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 24/07/2026.
//

import SwiftUI

struct RepositoryDetailView: View {

    @ObservedObject var vm: ExploreViewModel
    let repoID: RepositoryModel.ID

    @State private var contributors: [String] = []
    @State private var isLoadingContributors = false

    private var repo: RepositoryModel? {
        vm.allRepositories.first { $0.id == repoID }
    }

    var body: some View {

        Group {
            if let repo {

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

                        if isLoadingContributors {

                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)

                        } else if contributors.isEmpty {

                            Text("No contributor data available.")
                                .font(.subheadline)
                                .foregroundColor(.githubSecondary)

                        } else {

                            VStack(spacing: 0) {
                                ForEach(contributors, id: \.self) { name in
                                    ContributorRowView(username: name)
                                }
                            }
                        }

                        Button {
                            vm.toggleStar(id: repoID)
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
                .task {
                    isLoadingContributors = true
                    do {
                        contributors = try await GitHubRepository.shared.fetchContributors(
                            owner: repo.owner,
                            repo: repo.name
                        )
                    } catch {
                        contributors = []
                    }
                    isLoadingContributors = false
                }

            } else {

                Text("Repository not found.")
                    .foregroundColor(.githubSecondary)
            }
        }
        .background(Color.githubBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let vm = ExploreViewModel()
    return NavigationStack {
        RepositoryDetailView(vm: vm, repoID: UUID())
    }
}
