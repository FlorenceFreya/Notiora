//
//  JournalCard.swift
//  Notiora
//

import SwiftUI

struct JournalCard: View {

    let journal: Journal

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            HStack(alignment: .top) {

                Text(journal.title.isEmpty ? "无标题" : journal.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Spacer()

                Image(systemName: "star.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.yellow)
                    .opacity(journal.isFavorite ? 1 : 0)
                    .frame(width: 20)
            }

            Text(previewText)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            HStack {

                Text(dateString)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()

                Text("手记")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }

        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(.background)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.12), lineWidth: 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: 18))
    }

    private var previewText: String {

        guard let block = journal.blocks.first else {
            return "暂无内容"
        }

        let text = block.text.trimmingCharacters(in: .whitespacesAndNewlines)

        return text.isEmpty ? "暂无内容" : text
    }

    private var dateString: String {

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short

        return formatter.string(from: journal.updatedAt)
    }

}
