//
//  Journal.swift
//  Notiora
//

import Foundation
import SwiftData

@Model
final class Journal {

    @Attribute(.unique)
    var id: UUID

    var title: String

    var createdAt: Date

    var updatedAt: Date

    var isFavorite: Bool

    @Relationship(deleteRule: .cascade)
    var blocks: [JournalBlock]

    init(
        title: String = "无标题"
    ) {
        self.id = UUID()
        self.title = title
        self.createdAt = .now
        self.updatedAt = .now
        self.isFavorite = false
        self.blocks = [
            JournalBlock(
                type: .text,
                text: "",
                order: 0
            )
        ]
    }
}
