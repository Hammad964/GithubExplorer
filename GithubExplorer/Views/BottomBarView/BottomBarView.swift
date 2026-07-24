//
//  BottomBarView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct BottomTabBar: View {

    @Binding var selectedTab: Tab

    var body: some View {

        HStack {

            tabButton(
                image: "magnifyingglass",
                title: "Explore",
                index: .explore
            )

            Spacer()

            tabButton(
                image: "star",
                title: "Starred",
                index: .starred
            )

            Spacer()

            tabButton(
                image: "face.smiling",
                title: "Profile",
                index: .profile
            )
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 12)
//        .background(Color(.))
    }

    @ViewBuilder
    private func tabButton(image: String,
                           title: String,
                           index: Tab) -> some View {

        Button {

            selectedTab = index

        } label: {

            VStack(spacing: 6) {

                Image(systemName: image)
                    .font(.title3)

                Text(title)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == index ? .blue : .gray)
        }
    }
}
