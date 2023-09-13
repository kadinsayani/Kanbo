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
//    @Query(sort: \Card.timestamp, animation: .smooth) private var cards: [Card]
    @Query(sort: \Board.timestamp, animation: .smooth) private var boards: [Board]
    
//    @State private var isAddingCard = false
//    @State private var selectedCard: Card?
    @State private var isAddingBoard = false
    @State private var selectedBoard: Board?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedBoard) {
                ForEach(boards) { board in
                    NavigationLink {
                        Text(board.title)
                    } label: {
                        Text(board.title)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 220)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: addBoard) {
                        Label("Add", systemImage: "plus")
                    }
                    Button(action: deleteBoard) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $isAddingBoard) {
            BoardEditorView(isPresented: $isAddingBoard)
        }
    }

    private func addBoard() {
        isAddingBoard = true
    }
    
    private func deleteBoard() {
        // TODO: implement functionality
    }
//    private func addCard() {
//        isAddingCard = true
//    }
    
    // TODO: fix deleteCard functionality
//    private func deleteCard() {
//        if let selectedCard = selectedCard {
//            withAnimation {
//                modelContext.delete(selectedCard)
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
