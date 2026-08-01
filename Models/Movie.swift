//
//  Movie.swift
//  Notiora
//
//  Created by 方子谦 on 7/19/26.
//

import Foundation
import CoreTransferable
import UniformTypeIdentifiers

struct Movie: Transferable {

    let url: URL

    static var transferRepresentation: some TransferRepresentation {

        FileRepresentation(importedContentType: .movie) { received in

            let copy = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString)
                .appendingPathExtension(received.file.pathExtension)

            try FileManager.default.copyItem(
                at: received.file,
                to: copy
            )

            return Movie(url: copy)

        }

    }

}
