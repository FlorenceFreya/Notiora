//
//  ImageStorage.swift
//  Notiora
//
//  Created by 方子谦 on 7/11/26.
//

import Foundation
import UIKit

enum ImageStorage {

    static func save(_ image: UIImage) throws -> String {

        let fileName = UUID().uuidString + ".jpg"

        let url = documentsDirectory()
            .appendingPathComponent(fileName)

        guard let data = image.jpegData(compressionQuality: 0.9) else {
            throw NSError(domain: "ImageStorage", code: -1)
        }

        try data.write(to: url)

        return fileName
    }

    static func load(_ fileName: String) -> UIImage? {

        let url = documentsDirectory()
            .appendingPathComponent(fileName)

        return UIImage(contentsOfFile: url.path)
    }

    private static func documentsDirectory() -> URL {

        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]

    }
}
