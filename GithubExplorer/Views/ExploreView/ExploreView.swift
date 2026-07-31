//
//  ContentView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 17/07/2026.
//

import SwiftUI

struct ExploreView: View {

    @StateObject private var vm = ExploreViewModel()
 
    var body: some View {

        NavigationStack {
            VStack(spacing: 0) {

                HeaderView()

                Divider()

                ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .leading, spacing: 20) {

                        SearchBarView(text: $vm.searchText)
                            .onSubmit {
                                Task { await vm.search() }
                            }

                        LanguageFilterView(
                            selected: $vm.selectedLanguage,
                            languages: vm.languages
                        )

                        Text(vm.searchText.isEmpty ? "TRENDING" : "RESULTS")
                            .font(.headline)
                            .foregroundColor(.gray)

                        if vm.isLoading {

                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding(.top, 20)

                        } else if let error = vm.errorMessage {

                            Text(error)
                                .font(.subheadline)
                                .foregroundColor(.githubSecondary)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 20)

                        } else {

                            LazyVStack(spacing: 18) {

                                ForEach(vm.repositories) { repo in

                                    NavigationLink(destination: RepositoryDetailView(repo: repo)) {
                                        RepositoryCardView(repo: repo, onToggleStar: { vm.toggleStar(id: repo.id) })
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .task {
                    await vm.loadTrending()
                }
            }
            .background(Color.black)
        }
    }
}

#Preview {
    ExploreView()
}
