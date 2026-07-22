//
//  LanguagesChipsView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import SwiftUI

struct LanguageFilterView: View {

    @Binding var selected: String

    let languages: [String]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            LazyHStack(spacing: 12) {

                ForEach(languages, id: \.self) { language in

                    Button {

                        selected = language

                    } label: {

                        Text(language)
                            .fontWeight(.medium)
                            .foregroundColor(
                                selected == language
                                ? .black
                                : .gray
                            )
                            .padding(.horizontal,18)
                            .padding(.vertical,10)
                            .background(
                                selected == language
                                ? Color.blue
                                : Color.gray.opacity(0.15)
                            )
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}
