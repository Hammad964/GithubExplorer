//
//  ProfileHeaderView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: GitHubUser

    var body: some View {
        VStack(spacing: 18) {
            
            AvatarView(initials: user.initials)
            
            VStack(spacing: 6) {
                
                Text(user.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                Text("@\(user.username)")
                    .font(.title3)
                    .foregroundColor(.githubSecondary)
                
                Text(user.bio)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.githubSecondary)
            }
            
            ProfileStatsView(user: user)
        }
    }
}
