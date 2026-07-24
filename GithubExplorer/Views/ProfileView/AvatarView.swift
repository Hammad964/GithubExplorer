//
//  AvatarView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct AvatarView: View {
    
    let initials: String

    var body: some View {
        Circle()
            .fill(Color.githubCard)
            .frame(width: 135, height: 135)
            .overlay {
                
                Circle()
                    .stroke(Color.githubBorder)
            }
            .overlay {
                
                Text(initials)
                    .font(.system(size: 54))
                    .foregroundColor(.white)
            }        
    }
}
