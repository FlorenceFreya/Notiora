//
//  ThemeManager.swift
//  Notiora
//

import SwiftUI

enum AppThemeColor: String, CaseIterable, Identifiable {

    case blue
    case purple
    case green
    case orange
    case pink

    var id: String {
        rawValue
    }

    var name: String {
        switch self {
        case .blue:
            return "蓝色"
        case .purple:
            return "紫色"
        case .green:
            return "绿色"
        case .orange:
            return "橙色"
        case .pink:
            return "粉色"
        }
    }

    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .green:
            return .green
        case .orange:
            return .orange
        case .pink:
            return .pink
        }
    }
}
