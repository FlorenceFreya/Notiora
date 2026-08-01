//
//  AppearanceSettingsView.swift
//  Notiora
//

import SwiftUI

struct AppearanceSettingsView: View {

    @AppStorage("appAppearance")
    private var appearance = 0

    @AppStorage("themeColor")
    private var themeColor = AppThemeColor.blue.rawValue

    var body: some View {

        List {

            Section("显示模式") {

                Picker("外观", selection: $appearance) {

                    Text("跟随系统")
                        .tag(0)

                    Text("浅色")
                        .tag(1)

                    Text("深色")
                        .tag(2)
                }
                .labelsHidden()

                .pickerStyle(.inline)

            }

            Section("主题颜色") {

                ForEach(AppThemeColor.allCases) { theme in

                    Button {

                        themeColor = theme.rawValue

                    } label: {

                        HStack {

                            Circle()
                                .fill(theme.color)
                                .frame(width: 22, height: 22)

                            Text(theme.name)

                            Spacer()

                            if themeColor == theme.rawValue {

                                Image(systemName: "checkmark")
                                    .foregroundStyle(theme.color)

                            }

                        }

                    }
                    .buttonStyle(.plain)

                }

            }

        }
        .navigationTitle("外观")

    }

}

#Preview {

    NavigationStack {

        AppearanceSettingsView()

    }

}
