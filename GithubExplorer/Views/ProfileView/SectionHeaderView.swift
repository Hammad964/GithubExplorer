//
//  SectionHeaderView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let title: String

    var body: some View {
        HStack {
            
            Text(title)
                .font(.headline)
                .foregroundColor(.githubSecondary)
            
            Spacer()
        }
    }
}

#Preview {
    SectionHeaderView(title: "Section")
}
