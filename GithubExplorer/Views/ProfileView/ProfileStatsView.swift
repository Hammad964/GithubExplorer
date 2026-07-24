//
//  ProfileStatsView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct ProfileStatsView: View {
    
    let user: GitHubUser

    var body: some View {
        HStack {

            statView(number: user.repositories,
                     title: "Repos")
            
            Spacer()
            
            statView(number: user.followers,
                     title: "Followers")
            
            Spacer()
            
            statView(number: user.following,
                     title: "Following")
        }
        .padding(.horizontal, 40)
    }
    
    @ViewBuilder
    private func statView(number: Int,
                          title: String) -> some View {
        
        VStack(spacing: 4) {
            
            Text("\(number)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            Text(title)
                .foregroundColor(.githubSecondary)
        }
    }
}
