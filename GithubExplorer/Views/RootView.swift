//
//  RootView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 24/07/2026.
//

import SwiftUI

struct RootView: View {

    @State private var selectedTab: Tab = .explore

    var body: some View {

        VStack(spacing: 0) {

            Group {
                switch selectedTab {

                case .explore:
                    ExploreView()

                case .starred:
                    StarredView()

                case .profile:
                    ProfileView()
                }
            }

            BottomTabBar(selectedTab: $selectedTab)
        }
        .background(Color.githubBackground)
    }
}

#Preview {
    RootView()
}
