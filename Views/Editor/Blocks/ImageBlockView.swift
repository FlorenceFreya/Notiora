//
//  ImageBlockView.swift
//  MemoirPro
//

import SwiftUI

struct ImageBlockView: View {

    let block: JournalBlock
    let onDelete: () -> Void

    @State
    private var showDeleteAlert = false

    var body: some View {

        let url = FileStorage.imageURL(fileName: block.imageFileName ?? "")

        Group {

            if let image = UIImage(contentsOfFile: url.path) {

                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
                    )

            } else {

                RoundedRectangle(cornerRadius: 16)
                    .fill(.quaternary)
                    .frame(height: 220)
                    .overlay {

                        Label(
                            "图片加载失败",
                            systemImage: "photo"
                        )

                    }

            }

        }
        .contextMenu {

            Button(role: .destructive) {

                showDeleteAlert = true

            } label: {

                Label("删除图片", systemImage: "trash")

            }

        }
        .alert("删除图片？", isPresented: $showDeleteAlert) {

            Button("删除", role: .destructive) {

                if let fileName = block.imageFileName {

                    FileStorage.deleteImage(fileName: fileName)

                }

                onDelete()

            }

            Button("取消", role: .cancel) {}

        }

    }

}
