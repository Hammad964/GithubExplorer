//
//  RepositoryModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import Foundation
import SwiftUI

struct RepositoryModel: Identifiable {

    let id = UUID()

    let name: String
    let owner: String
    let description: String

    let language: String
    let languageColor: Color

    let stars: String
    let forks: String
    
    let issues: String
    let contributors: [String]
    var starred: Bool = false
}
