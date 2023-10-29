//
//  Theme.swift
//  Flashcards
//
//  Created by Bell Chen on 10/28/23.
//

import SwiftUI


enum Theme: String, Codable {
    case green
    case orange
    case red
    case blue
    case purple
    case yellow
    case tan
    case teal
    case indigo
    case magenta

    
    var accentColor: Color {
        switch self {
        case .green, .red, .orange,.tan, .teal, .yellow: return .black
        case .indigo, .magenta, .blue,.purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
}
