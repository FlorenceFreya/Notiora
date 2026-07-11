//
//  RichTextView.swift
//  MemoirPro
//
//  Created by 方子谦 on 7/11/26.
//

import SwiftUI
import UIKit

struct RichTextView: UIViewRepresentable {

    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {

        let textView = UITextView()

        textView.delegate = context.coordinator

        textView.font = UIFont.preferredFont(
            forTextStyle: .body
        )

        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(
            top: 16,
            left: 8,
            bottom: 16,
            right: 8
        )

        textView.textContainer.lineFragmentPadding = 0

        textView.alwaysBounceVertical = true

        textView.keyboardDismissMode = .interactive

        textView.autocorrectionType = .yes

        textView.smartQuotesType = .yes

        textView.smartDashesType = .yes

        textView.text = text

        textView.isScrollEnabled = true

        return textView

    }

    func updateUIView(
        _ uiView: UITextView,
        context: Context
    ) {

        if uiView.text != text {
            uiView.text = text
        }

    }

    func makeCoordinator() -> Coordinator {

        Coordinator(self)

    }

    class Coordinator: NSObject, UITextViewDelegate {

        var parent: RichTextView

        init(_ parent: RichTextView) {

            self.parent = parent

        }

        func textViewDidChange(
            _ textView: UITextView
        ) {

            parent.text = textView.text

        }

    }

}
