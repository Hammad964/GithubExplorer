//
//  HeaderView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct HeaderView: View {

    @State var title: String = "Explore"
    var body: some View {

        HStack {

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal)
        .padding(.top)
        .frame(height: 70)
    }
}
