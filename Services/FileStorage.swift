//
//  FileStorage.swift
//  MemoirPro
//

import Foundation
import UIKit

enum FileStorage {

    // MARK: - Documents

    private static var documentsDirectory: URL {

        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]

    }

    // MARK: - Images

    static var imagesDirectory: URL {

        createDirectory(named: "Images")

    }

    // MARK: - Videos

    static var videosDirectory: URL {

        createDirectory(named: "Videos")

    }

    // MARK: - 创建文件夹

    private static func createDirectory(named folderName: String) -> URL {

        let folder = documentsDirectory.appendingPathComponent(folderName)

        if !FileManager.default.fileExists(atPath: folder.path) {

            try? FileManager.default.createDirectory(
                at: folder,
                withIntermediateDirectories: true
            )

        }

        return folder

    }

    // MARK: - 保存图片

    @discardableResult
    static func saveImage(_ image: UIImage) throws -> String {

        guard let data = image.jpegData(compressionQuality: 0.9) else {

            throw NSError(
                domain: "ImageError",
                code: -1
            )

        }

        let fileName = UUID().uuidString + ".jpg"

        let url = imagesDirectory.appendingPathComponent(fileName)

        try data.write(to: url)

        return fileName

    }

    // MARK: - 保存图片Data

    @discardableResult
    static func saveImage(_ data: Data) throws -> String {

        let fileName = UUID().uuidString + ".jpg"

        let url = imagesDirectory.appendingPathComponent(fileName)

        try data.write(to: url)

        return fileName

    }

    // MARK: - 加载图片

    static func loadImage(fileName: String) -> UIImage? {

        let url = imagesDirectory.appendingPathComponent(fileName)

        return UIImage(contentsOfFile: url.path)

    }

    // MARK: - 删除图片

    static func deleteImage(fileName: String) {

        let url = imagesDirectory.appendingPathComponent(fileName)

        try? FileManager.default.removeItem(at: url)

    }

    // MARK: - 图片URL

    static func imageURL(fileName: String) -> URL {

        imagesDirectory.appendingPathComponent(fileName)

    }

    // MARK: - 保存视频

    @discardableResult
    static func saveVideo(from sourceURL: URL) throws -> String {

        let ext = sourceURL.pathExtension

        let fileName = UUID().uuidString + "." + ext

        let destination = videosDirectory.appendingPathComponent(fileName)

        if FileManager.default.fileExists(atPath: destination.path) {

            try? FileManager.default.removeItem(at: destination)

        }

        try FileManager.default.copyItem(
            at: sourceURL,
            to: destination
        )

        return fileName

    }

    // MARK: - 删除视频

    static func deleteVideo(fileName: String) {

        let url = videosDirectory.appendingPathComponent(fileName)

        try? FileManager.default.removeItem(at: url)

    }

    // MARK: - 视频URL

    static func videoURL(fileName: String) -> URL {

        videosDirectory.appendingPathComponent(fileName)

    }

}
