//
//  ContentView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    // sorted by newest on top
    @Query(sort: \Board.timestamp, order: .reverse, animation: .smooth) private var boards: [Board]

    @State private var isAddingBoard = false
    @State private var showingCommandPalette = false
    @State private var selectedBoard: Board?

    var body: some View {
        NavigationSplitView {
            ScrollView {
                ForEach(boards, id: \.id) { board in
                    Button(action: {
                        selectedBoard = board
                    }) {
                        NavigationLink(destination: BoardView(board: board, cards: board.cards)) {
                            BoardStatesView(board: board)
                                .cornerRadius(5)
                                .padding(5)
                                .font(selectedBoard == board ? .headline : .subheadline)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())
                    }.padding(5).cornerRadius(5)
                }
            }
            .navigationSplitViewColumnWidth(min: 260, ideal: 260)
            .toolbar {
                ToolbarItemGroup {
                    // TODO: getNewestBoard() after add
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
            if let selectedBoard = selectedBoard {
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
        if let selectedBoard = selectedBoard {
            print("Deleting board: \(selectedBoard.title)")
            withAnimation {
                modelContext.delete(selectedBoard)
                do {
                    try modelContext.save()
                } catch {
                    print("Error deleting board: \(error.localizedDescription)")
                }
            }
        }
        getNewestBoard()
    }

    public func getNewestBoard() {
        if let mostRecentBoard = boards.first {
            selectedBoard = mostRecentBoard
        } else {
            selectedBoard = nil
        }
    }

    private func renameBoard() {
        // TODO: renameBoard implementation
        print("renaming board")
    }
}

// #Preview {
//    ContentView()
// }
