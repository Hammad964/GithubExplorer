//
//  StarredView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct StarredView: View {
    
    @StateObject private var vm = ExploreViewModel()
    @State private var selectedTab = 1

    var body: some View {
        VStack(spacing: 0) {

            HeaderView(title: "SAVED")

            Divider()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(alignment: .leading, spacing: 20) {

                    Text("STARRED REPOSITORIES")
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
    StarredView()
}
