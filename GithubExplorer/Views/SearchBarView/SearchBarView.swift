//
//  SearchBarView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var text: String

    var body: some View {

        HStack {

            Image(systemName: "magnifyingglass")

            TextField("Search repositories or users",
                      text: $text)

        }
        .padding(14)
        .background(Color(.systemGray6).opacity(0.15))
        .cornerRadius(14)
    }
}
