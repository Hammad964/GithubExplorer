//
//  RepoDetailHeaderView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

struct RepositoryDetailHeaderView: View {
    
    let repo: RepositoryModel

    var body: some View {
        VStack(spacing: 10) {
            
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 56, height: 56)
            
            Text(repo.name)
                .font(.title3.bold())
                .foregroundColor(.white)
            
            Text(repo.owner)
                .font(.subheadline)
                .foregroundColor(.githubSecondary)
        }
        .padding(.top, 8)
        .padding(.bottom, 18)
    }
}
