//
//  StarredView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct StarredView: View {

    @ObservedObject var vm: ExploreViewModel

    var starredRepos: [RepositoryModel] {
        vm.allRepositories.filter { $0.starred }
    }

    var body: some View {

        NavigationStack {

            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .leading, spacing: 18) {

                    if starredRepos.isEmpty {

                        Text("Nothing starred yet — tap ☆ on any repo.")
                            .font(.subheadline)
                            .foregroundColor(.githubSecondary)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 60)

                    } else {

                        ForEach(starredRepos) { repo in

                            NavigationLink(destination: RepositoryDetailView(vm: vm, repoID: repo.id)) {
                                RepositoryCardView(
                                    repo: repo,
                                    onToggleStar: { vm.toggleStar(id: repo.id) }
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .background(Color.githubBackground)
            .navigationTitle("Saved")
        }
    }
}

#Preview {
    StarredView(vm: ExploreViewModel())
}
