//
//  ProfileView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var exploreVM: ExploreViewModel
    @StateObject private var vm = ProfileViewModel()

    var myRepos: [RepositoryModel] {
        guard let username = vm.user?.username else { return [] }
        return exploreVM.allRepositories.filter { $0.owner == username }
    }

    var body: some View {
        VStack(spacing: 0) {

            HeaderView(title: "Profile")

            Divider()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 30) {

                    if vm.isLoading {

                        ProgressView().padding(.top, 40)

                    } else if let error = vm.errorMessage {

                        Text(error)
                            .foregroundColor(.githubSecondary)
                            .padding(.top, 40)

                    } else if let user = vm.user {

                        ProfileHeaderView(user: user)

                        SectionHeaderView(title: "YOUR REPOSITORIES")

                        LazyVStack(spacing: 20) {
                            ForEach(myRepos) { repo in
                                RepositoryCardView(
                                    repo: repo,
                                    onToggleStar: { exploreVM.toggleStar(id: repo.id) }
                                )
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.githubBackground)
        .task {
            await vm.loadProfile(username: "hammad964", into: exploreVM)
        }
    }
}

#Preview {
    ProfileView(exploreVM: ExploreViewModel())
}
