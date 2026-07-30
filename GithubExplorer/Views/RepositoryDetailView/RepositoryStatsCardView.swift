//
//  RepositoryStatsCardView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

struct RepositoryStatsCardView: View {
    
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(label.uppercased())
                .font(.caption2)
                .foregroundColor(.githubSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.githubCard)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.githubBorder, lineWidth: 1)
        )
        .cornerRadius(10)
    }
}
