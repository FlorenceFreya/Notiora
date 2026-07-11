//
//  SidebarItem.swift
//  MemoirPro
//

import Foundation

enum SidebarItem: String, CaseIterable, Identifiable {

    case all
    case favorites
    
    case settings

    var id: String {
        rawValue
    }

    var title: String {

        switch self {

        case .all:
            return "全部笔记"

        case .favorites:
            return "收藏"

        case .settings:
            return "设置"

        }

    }

    var systemImage: String {

        switch self {

        case .all:
            return "book.closed.fill"

        case .favorites:
            return "star.fill"

        case .settings:
            return "gearshape.fill"

        }

    }

}
