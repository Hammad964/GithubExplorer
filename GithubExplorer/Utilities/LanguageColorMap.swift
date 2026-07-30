//
//  LanguageColorMap.swift
//  GithubExplorer
//
//  Created by Hammad Ahmed on 30/07/2026.
//

import SwiftUI

enum LanguageColorMap {
    static let colors: [String: Color] = [
        "Swift": .orange,
        "Kotlin": .purple,
        "TypeScript": .blue,
        "Python": .yellow,
        "Go": .cyan,
        "Rust": .brown
    ]

    static func color(for language: String?) -> Color {
        guard let language else { return .gray }
        return colors[language] ?? .gray
    }
}
