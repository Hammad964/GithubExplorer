//
//  RepositoryStatsRowView.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

struct RepositoryStatsRowView: View {
    
    let repo: RepositoryModel

    var body: some View {
        HStack(spacing: 10) {
            
            RepositoryStatsCardView(value: repo.stars, label: "Stars")
            RepositoryStatsCardView(value: repo.forks, label: "Forks")
            RepositoryStatsCardView(value: repo.issues, label: "Issues")
        }
    }
}
