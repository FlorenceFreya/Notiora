//
//  ImagePicker.swift
//  Notiora
//
//  Created by 方子谦 on 7/15/26.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {

    @Binding var selectedItem: PhotosPickerItem?

    var body: some View {

        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {

            Label("插入图片", systemImage: "photo")
        }
    }
}
