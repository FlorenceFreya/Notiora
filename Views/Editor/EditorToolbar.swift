//
//  EditorToolbar.swift
//  Notiora
//

import SwiftUI
import PhotosUI

struct EditorToolbar: View {

    @Binding var selectedPhoto: PhotosPickerItem?

    @Binding var selectedVideo: PhotosPickerItem?

    var onBold: () -> Void
    var body: some View {

        HStack(spacing: 14) {

            toolbarButton(
                systemImage: "bold",
                action: onBold
            )

            Divider()
                .frame(height: 22)

            PhotosPicker(
                selection: $selectedPhoto,
                matching: .images
            ) {

                Image(systemName: "photo")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: 36, height: 36)

            }
            .buttonStyle(.plain)

            PhotosPicker(
                selection: $selectedVideo,
                matching: .videos
            ) {

                Image(systemName: "video")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: 36, height: 36)

            }
            .buttonStyle(.plain)

            toolbarButton(
                systemImage: "checklist",
                action: { }
            )

            toolbarButton(
                systemImage: "highlighter",
                action: { }
            )

            toolbarButton(
                systemImage: "paperclip",
                action: { }
            )

            Spacer()

            toolbarButton(
                systemImage: "ellipsis.circle",
                action: { }
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .overlay(alignment: .top) {
            Divider()
        }
    }

    @ViewBuilder
    private func toolbarButton(
        systemImage: String,
        action: @escaping () -> Void
    ) -> some View {

        Button(action: action) {

            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .medium))
                .frame(width: 36, height: 36)
                .contentShape(Rectangle())

        }
        .buttonStyle(.plain)

    }

}
