//
//  RepositoryModel.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 22/07/2026.
//

import Foundation
import SwiftUI

struct Repository: Identifiable {

    let id = UUID()

    let name: String
    let description: String

    let language: String
    let languageColor: Color

    let stars: String
    let forks: String
}
