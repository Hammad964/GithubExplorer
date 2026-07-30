//
//  ContributorRowView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

struct ContributorRowView: View {
    
    let username: String

    var body: some View {
        HStack(spacing: 10) {
            
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 26, height: 26)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.caption2)
                        .foregroundColor(.githubSecondary)
                )
            
            Text(username)
                .font(.subheadline)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.vertical, 8)
        
        Divider()
            .background(Color.githubBorder)
    }
}
