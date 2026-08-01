//
//  HomeView.swift
//  Notiora
//

import SwiftUI
import SwiftData
import SwipeActions


struct HomeView: View {


    @Environment(\.modelContext)
    private var modelContext


    @Query(
        sort: \Journal.updatedAt,
        order: .reverse
    )
    private var journals: [Journal]


    @State
    private var selection: SidebarItem? = .all


    @State
    private var searchText = ""




    private var filteredJournals: [Journal] {


        var result = journals



        if selection == .favorites {


            result = result.filter {

                $0.isFavorite

            }

        }



        if !searchText.isEmpty {


            result = result.filter {

                $0.title.localizedCaseInsensitiveContains(
                    searchText
                )

            }

        }



        return result

    }





    var body: some View {


        NavigationSplitView(
            columnVisibility: .constant(.doubleColumn)
        ) {


            SidebarView(
                selection: $selection
            )


        } detail: {


            contentView


        }

    }




    @ViewBuilder
    private var contentView: some View {


        switch selection {


        case .settings:


            SettingsView()



        default:


            NavigationStack {


                List {


                    ForEach(filteredJournals) { journal in



                        SwipeView {


                            NavigationLink {


                                JournalEditorView(
                                    journal: journal
                                )


                            } label: {


                                JournalCard(
                                    journal: journal
                                )


                            }
                            .buttonStyle(.plain)



                        } trailingActions: {_ in 



                            SwipeAction(
                                systemImage:
                                    journal.isFavorite
                                    ? "star.slash"
                                    : "star",

                                backgroundColor:
                                    .yellow
                            ) {


                                journal.isFavorite.toggle()
                                journal.updatedAt = .now


                            }





                            SwipeAction(
                                systemImage:
                                    "trash",

                                backgroundColor:
                                    .red
                            ) {


                                modelContext.delete(
                                    journal
                                )


                            }


                        }
                        .swipeActionsStyle(
                            .cascade
                        )



                    }


                }

                .listStyle(.plain)



                .navigationTitle(
                    title
                )



                .searchable(
                    text: $searchText,
                    prompt: "搜索笔记"
                )



                .toolbar {


                    ToolbarItem(
                        placement:
                            .topBarTrailing
                    ) {


                        Button {


                            createJournal()


                        } label: {


                            Image(
                                systemName:
                                    "square.and.pencil"
                            )


                        }


                    }


                }



            }


        }


    }





    private var title: String {


        switch selection {


        case .favorites:

            return "收藏"



        default:

            return "全部笔记"


        }

    }




    private func createJournal() {


        let journal = Journal()


        modelContext.insert(
            journal
        )


    }


}




#Preview {


    HomeView()

        .modelContainer(
            for:
            [
                Journal.self,
                JournalBlock.self
            ]
        )


}
