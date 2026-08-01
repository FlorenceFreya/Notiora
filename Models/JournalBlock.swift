//
//  JournalBlock.swift
//  Notiora
//

import Foundation
import SwiftData

@Model
final class JournalBlock {

    @Attribute(.unique)
    var id: UUID

    /// Block 类型
    var type: BlockType

    /// 文本内容
    var text: String

    /// 图片文件名
    var imageFileName: String?

    /// 视频文件名
    var videoFileName: String?

    /// 排序
    var order: Int

    /// 创建时间
    var createdAt: Date

    /// 更新时间
    var updatedAt: Date

    init(
        type: BlockType = .text,
        text: String = "",
        imageFileName: String? = nil,
        videoFileName: String? = nil,
        order: Int = 0
    ) {

        self.id = UUID()
        self.type = type
        self.text = text
        self.imageFileName = imageFileName
        self.videoFileName = videoFileName
        self.order = order
        self.createdAt = .now
        self.updatedAt = .now
    }

    /// 修改内容后更新时间
    func touch() {
        updatedAt = .now
    }

}

enum BlockType: Int, Codable, CaseIterable {

    /// 普通文字
    case text

    /// 图片
    case image

    /// 视频
    case video

}
