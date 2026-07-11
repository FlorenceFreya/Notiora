//
//  VideoBlockView.swift
//  MemoirPro
//

import SwiftUI
import AVKit

struct VideoBlockView: View {

    let block: JournalBlock

    var onDelete: () -> Void

    @State
    private var player: AVPlayer?

    @State
    private var showDeleteAlert = false

    var body: some View {

        let fileName = block.videoFileName ?? ""

        let url = FileStorage.videoURL(fileName: fileName)

        Group {

            if FileManager.default.fileExists(atPath: url.path) {

                if let player {

                    VideoPlayer(player: player)
                        .frame(height: 260)

                } else {

                    RoundedRectangle(cornerRadius: 18)
                        .fill(.quaternary)
                        .frame(height: 260)
                        .overlay {

                            ProgressView()

                        }

                }

            } else {

                RoundedRectangle(cornerRadius: 18)
                    .fill(.quaternary)
                    .frame(height: 260)
                    .overlay {

                        Label(
                            "视频加载失败",
                            systemImage: "video.slash"
                        )

                    }

            }

        }
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
        .onAppear {

            if FileManager.default.fileExists(atPath: url.path) {

                player = AVPlayer(url: url)

            }

        }
        .onDisappear {

            player?.pause()

        }
        .contextMenu {

            Button(role: .destructive) {

                showDeleteAlert = true

            } label: {

                Label(
                    "删除视频",
                    systemImage: "trash"
                )

            }

        }
        .alert(
            "删除视频？",
            isPresented: $showDeleteAlert
        ) {

            Button(
                "删除",
                role: .destructive
            ) {

                if let fileName = block.videoFileName {

                    FileStorage.deleteVideo(
                        fileName: fileName
                    )

                }

                onDelete()

            }

            Button(
                "取消",
                role: .cancel
            ) { }

        }

    }

}
