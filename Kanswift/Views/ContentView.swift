//
//  ContentView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @StateObject private var navigationContext = NavigationContext()
    @Environment(\.modelContext) private var modelContext
    // sorted by newest on top
    @Query(sort: \Board.timestamp, order: .reverse, animation: .smooth) private var boards: [Board]

    @State private var isAddingBoard = false
    @State private var showingCommandPalette = false

    var body: some View {
        NavigationSplitView {
            ScrollView {
                ForEach(boards, id: \.id) { board in
                    NavigationLink {
                        BoardView(board: board, cards: board.cards)
                    } label: {
                        // state counts
                        BoardStatesView(board: board)
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
                    Button(action: { showingCommandPalette = true }) {
                        Label("Command Palette", systemImage: "command.square.fill")
                    }.keyboardShortcut("p")
                }
            }
            .contextMenu {
                Button(action: renameBoard) {
                    Label("Rename", systemImage: "return")
                }
                Button(role: .destructive, action: deleteBoard) {
                    Label("Delete", systemImage: "trash.circle")
                }
            }
        } detail: {
            if let selectedBoard = navigationContext.selectedBoard {
                BoardView(board: selectedBoard, cards: selectedBoard.cards)
            } else {
                Text("Select a Board")
            }
        }.onAppear {
            getNewestBoard()
        }
        .sheet(isPresented: $isAddingBoard) {
            BoardEditorView(isPresented: $isAddingBoard)
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/ .defaultAction/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $showingCommandPalette) {
            CommandPaletteView(showingCommandPalette: $showingCommandPalette, command: "")
        }.keyboardShortcut(.defaultAction)
    }

    private func addBoard() {
        isAddingBoard = true
    }

    private func deleteBoard() {
        // TODO: fix bug after all deleted (should show detail)
        withAnimation {
            if let selectedBoard = navigationContext.selectedBoard {
                modelContext.delete(selectedBoard)
            }
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
            getNewestBoard()
        }
    }

    private func getNewestBoard() {
        if let mostRecentBoard = boards.first {
            navigationContext.selectedBoard = mostRecentBoard
        }
    }

    private func renameBoard() {
        // TODO: renameBoard implementatin
        print("renaming board")
    }
}

// #Preview {
//    ContentView()
// }
