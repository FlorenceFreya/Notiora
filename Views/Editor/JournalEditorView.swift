//
//  JournalEditorView.swift
//  Notiora
//

import SwiftUI
import SwiftData
import PhotosUI

struct JournalEditorView: View {

    @Bindable var journal: Journal

    @State
    private var selectedPhoto: PhotosPickerItem?

    @State
    private var selectedVideo: PhotosPickerItem?

    var body: some View {

        VStack(spacing: 0) {

            // MARK: 标题

            TextField("标题", text: $journal.title)
                .font(.largeTitle.bold())
                .padding()

            Divider()

            // MARK: 内容

            ScrollView {

                LazyVStack(alignment: .leading, spacing: 20) {

                    ForEach(
                        journal.blocks.sorted { $0.order < $1.order },
                        id: \.id
                    ) { block in

                        blockView(block)

                    }

                }
                .padding()

            }

        }
        .navigationBarTitleDisplayMode(.inline)

        .safeAreaInset(edge: .bottom) {

            EditorToolbar(
                selectedPhoto: $selectedPhoto,
                selectedVideo: $selectedVideo
            ) {

                print("Bold")

            }

        }

        // 图片导入

        .onChange(of: selectedPhoto) { _, item in

            guard let item else { return }

            importPhoto(item)

        }

        // 视频导入

        .onChange(of: selectedVideo) { _, item in

            guard let item else { return }

            importVideo(item)

        }

    }
}

private extension JournalEditorView {

    // MARK: Block

    @ViewBuilder
    func blockView(_ block: JournalBlock) -> some View {

        switch block.type {

        case .text:

            TextBlockView(block: block) {

                journal.updatedAt = .now

            }

        case .image:

            if let fileName = block.imageFileName {

                ImageBlockView(
                    block: block
                ) {

                    FileStorage.deleteImage(fileName: fileName)

                    delete(block)

                }

            }

        case .video:

            VideoBlockView(block: block) {

                if let fileName = block.videoFileName {

                    FileStorage.deleteVideo(fileName: fileName)

                }

                journal.blocks.removeAll {

                    $0.id == block.id

                }

                journal.updatedAt = .now

            }

        }

    }

    // MARK: 删除 Block

    func delete(_ block: JournalBlock) {

        journal.blocks.removeAll {

            $0.id == block.id

        }

        journal.updatedAt = .now

    }

    // MARK: 导入图片

    func importPhoto(_ item: PhotosPickerItem) {

        Task {

            do {

                guard let data = try await item.loadTransferable(type: Data.self)
                else { return }

                let fileName = try FileStorage.saveImage(data)

                let block = JournalBlock(

                    type: .image,

                    imageFileName: fileName,

                    order: journal.blocks.count

                )

                journal.blocks.append(block)

                journal.updatedAt = .now

                selectedPhoto = nil

            } catch {

                print(error)

            }

        }

    }

    // MARK: 导入视频

    func importVideo(_ item: PhotosPickerItem) {

        Task {

            do {

                guard let movie = try await item.loadTransferable(type: Movie.self)
                else { return }

                let fileName = try FileStorage.saveVideo(from: movie.url)

                let block = JournalBlock(

                    type: .video,

                    videoFileName: fileName,

                    order: journal.blocks.count

                )

                journal.blocks.append(block)

                journal.updatedAt = .now

                selectedVideo = nil

            } catch {

                print(error)

            }

        }

    }

}
