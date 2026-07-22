//
//  ContentView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 17/07/2026.
//

import SwiftUI

struct ExploreView: View {

    @StateObject private var vm = ExploreViewModel()
    @State private var selectedTab = 0

    var body: some View {

        VStack(spacing: 0) {

            HeaderView()

            Divider()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .leading, spacing: 20) {

                    SearchBarView(text: $vm.searchText)

                    LanguageFilterView(
                        selected: $vm.selectedLanguage,
                        languages: vm.languages
                    )

                    Text("TRENDING")
                        .font(.headline)
                        .foregroundColor(.gray)

                    LazyVStack(spacing: 18) {

                        ForEach(vm.repositories) { repo in

                            RepositoryCard(repo: repo)
                        }
                    }
                }
                .padding()
            }

            BottomTabBar(selectedTab: $selectedTab)
        }
        .background(Color.black)
    }
}

#Preview {
    ExploreView()
}
