//
//  ProfileView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 23/07/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0) {

            HeaderView(title: "Profile")
            
            Divider()
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 30) {
                    
                    ProfileHeaderView(user: vm.user)
                    
                    SectionHeaderView(title: "YOUR REPOSITORIES")
                    
                    LazyVStack(spacing: 20) {
                        
                        ForEach(vm.repositories) { repo in
                            
                            RepositoryCard(repo: repo)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.githubBackground)
    }
}

#Preview {
    ProfileView()
}
