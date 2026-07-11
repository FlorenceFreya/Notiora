//
//  MemoirProApp.swift
//  MemoirPro
//

import SwiftUI
import SwiftData


@main
struct MemoirProApp: App {


    // MARK: - 外观模式

    @AppStorage("appAppearance")
    private var appearance = 0



    // MARK: - 主题颜色

    @AppStorage("themeColor")
    private var themeColor =
        AppThemeColor.blue.rawValue




    private var colorScheme: ColorScheme? {


        switch appearance {


        case 1:

            return .light



        case 2:

            return .dark



        default:

            return nil


        }


    }





    private var accentColor: Color {


        AppThemeColor(
            rawValue: themeColor
        )?.color ?? .blue


    }






    // MARK: - SwiftData

    var sharedModelContainer: ModelContainer = {


        let schema = Schema([

            Journal.self,

            JournalBlock.self,

        ])




        let configuration = ModelConfiguration(

            schema: schema,

            isStoredInMemoryOnly: false

        )




        do {


            return try ModelContainer(

                for: schema,

                configurations:
                    [configuration]

            )



        } catch {


            fatalError(

                "无法创建 ModelContainer：\(error)"

            )


        }



    }()





    // MARK: - App

    var body: some Scene {


        WindowGroup {


            HomeView()

                .preferredColorScheme(
                    colorScheme
                )

                .tint(
                    accentColor
                )


        }


        .modelContainer(
            sharedModelContainer
        )


    }


}
