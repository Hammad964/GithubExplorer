//
//  BottomBarView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct BottomTabBar: View {

    @Binding var selectedTab: Int

    var body: some View {

        HStack {

            tabButton(
                image: "magnifyingglass",
                title: "Explore",
                index: 0
            )

            Spacer()

            tabButton(
                image: "star",
                title: "Saved",
                index: 1
            )

            Spacer()

            tabButton(
                image: "face.smiling",
                title: "Profile",
                index: 2
            )
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 12)
//        .background(Color(.))
    }

    @ViewBuilder
    private func tabButton(image: String,
                           title: String,
                           index: Int) -> some View {

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
