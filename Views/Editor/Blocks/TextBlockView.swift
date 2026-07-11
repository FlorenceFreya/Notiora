//
//  TextBlockView.swift
//  MemoirPro
//
//  Created by 方子谦 on 7/11/26.
//

import SwiftUI

struct TextBlockView: View {

    @Bindable var block: JournalBlock
    var onChange: () -> Void

    var body: some View {

        RichTextView(
            text: Binding(
                get: {
                    block.text
                },
                set: { value in
                    block.text = value
                    onChange()
                }
            )
        )
        .frame(minHeight: 120)

    }

}
