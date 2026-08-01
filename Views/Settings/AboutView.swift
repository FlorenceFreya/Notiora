//
//  AboutView.swift
//  Notiora
//

import SwiftUI

struct AboutView: View {

    @State private var tapCount = 0
    @State private var showEasterEgg = false

    var body: some View {

        List {

            // MARK: Logo

            Section {

                VStack(spacing: 16) {

                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.blue)
                        .onTapGesture {

                            tapCount += 1

                            if tapCount >= 5 {

                                tapCount = 0
                                showEasterEgg = true

                            }

                        }


                    Text("Notiora")
                        .font(.title)
                        .fontWeight(.bold)


                    Text("记录每一个值得珍藏的瞬间")
                        .foregroundStyle(.secondary)

                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)

            }


            // MARK: 信息

            Section("应用信息") {

                HStack {

                    Text("版本")

                    Spacer()

                    Text("2.0 Beta")
                        .foregroundStyle(.secondary)

                }


                HStack {

                    Text("开发者")

                    Spacer()

                    Text("方子谦")
                        .foregroundStyle(.secondary)

                }


                HStack {

                    Text("技术")

                    Spacer()

                    Text("SwiftUI + SwiftData")
                        .foregroundStyle(.secondary)

                }

            }


            // MARK: 介绍

            Section("关于 Notiora") {

                Text("""
Notiora 是一个专注于记录生活的应用。

文字、图片、视频，
都可以成为未来珍贵的回忆。
""")

            }


            // MARK: 彩蛋提示

            Section {

                Text("连续点击顶部图标 5 次，会发现一个小惊喜 🎉")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

            }


            // MARK: Copyright

            Section {

                Text("© 2026 Notiora")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondary)

            }

        }

        .navigationTitle("关于")
        .navigationBarTitleDisplayMode(.large)


        .alert(
            "🎉 彩蛋",
            isPresented: $showEasterEgg
        ) {

            Button("继续加油！") { }

        } message: {

            Text("""
欢迎来到 Notiora 2.0 Beta！

感谢参与测试 ❤️

愿每一篇记录，
都成为未来值得珍藏的回忆。

—— Notiora
""")

        }

    }

}


#Preview {

    NavigationStack {

        AboutView()

    }

}
