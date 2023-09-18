//
//  ContentView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    // sorted by newest on top
    @Query(sort: \Board.timestamp, order: .reverse, animation: .smooth) private var boards: [Board]
    
    @State private var isAddingBoard = false
    @State private var selectedBoard: Board?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedBoard) {
                ForEach(boards) { board in
                    NavigationLink {
                        BoardView(board: board)
                    } label: {
                        // state counts
                        Text("\(board.title)")
                        Spacer()
                        let backlogCount = board.cards.filter({$0.cardState == "Backlog"}).count
                        let backlogCountText = Text("\(backlogCount)").foregroundStyle(Color("kanswift.orange"))
                        let doingCount = board.cards.filter({$0.cardState == "Doing"}).count
                        let doingCountText = Text("\(doingCount)").foregroundStyle(Color("kanswift.purple"))
                        let doneCount = board.cards.filter({$0.cardState == "Done"}).count
                        let doneCountText = Text("\(doneCount)").foregroundStyle(Color("kanswift.cyan"))
                        let reviewCount = board.cards.filter({$0.cardState == "Review"}).count
                        let reviewCountText = Text("\(reviewCount)").foregroundStyle(Color("kanswift.white"))
                        Text("\(backlogCountText) | \(doingCountText) | \(doneCountText) | \(reviewCountText)")
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 260, ideal: 260)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: addBoard) {
                        Label("Add Board", systemImage: "plus")
                    }.keyboardShortcut("b")
                    Button(role: .destructive, action: deleteBoard) {
                        Label("Delete Board", systemImage: "trash")
                    }.keyboardShortcut(.delete)
                }
            }
        } detail: {
            if let selectedBoard = selectedBoard {
                BoardView(board: selectedBoard)
            } else {
                Text("Select a Board")
            }
        }.onAppear {
            // default selection of newest board
            if let mostRecentBoard = boards.first {
                selectedBoard = mostRecentBoard
            }
        }
        .sheet(isPresented: $isAddingBoard) {
            BoardEditorView(isPresented: $isAddingBoard) // add board
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/.defaultAction/*@END_MENU_TOKEN@*/)
    }

    private func addBoard() {
        isAddingBoard = true
    }
    
    private func deleteBoard() {
        // TODO: implement functionality
    }
    
    // TODO: right click to rename board
}

//#Preview {
//    ContentView()
//}
