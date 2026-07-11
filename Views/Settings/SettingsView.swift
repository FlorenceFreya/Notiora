//
//  SettingsView.swift
//  MemoirPro
//

import SwiftUI

struct SettingsView: View {

    var body: some View {

        NavigationStack {

            List {

                Section("外观") {

                    NavigationLink {

                        AppearanceSettingsView()

                    } label: {

                        Label(
                            "外观",
                            systemImage: "paintbrush"
                        )

                    }

                }

                Section("关于") {

                    NavigationLink {

                        AboutView()

                    } label: {

                        Label(
                            "版本信息",
                            systemImage: "info.circle"
                        )

                    }

                }

            }
            .navigationTitle("设置")

        }

    }

}

#Preview {

    SettingsView()

}
