//
//  SwipeCell.swift
//  MemoirPro
//

import SwiftUI
import SwipeActions

struct SwipeCell<Content: View>: View {

    @ViewBuilder var content: () -> Content

    var onFavorite: () -> Void
    var onDelete: () -> Void

    var body: some View {

        SwipeView {

            content()
                .clipShape(RoundedRectangle(cornerRadius: 18))

        } trailingActions: { _ in

            SwipeAction(
                systemImage: "star.fill",
                backgroundColor: .orange
            ) {
                onFavorite()
            }
            .allowSwipeToTrigger(false)

            SwipeAction(
                systemImage: "trash.fill",
                backgroundColor: .red
            ) {
                onDelete()
            }
            .allowSwipeToTrigger(true)
        }
        .swipeSpacing(8)
        .swipeActionsStyle(.cascade)
    }
}
