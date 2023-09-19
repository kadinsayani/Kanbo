//
//  Board.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-12.
//

import SwiftData
import SwiftUI

struct BoardView: View {
    var board: Board
    @State var cards: [Card]
    
    @State private var isAddingCard = false
    @State private var selectedCard: Card?
    
    var body: some View {
        // TODO: moving items drag and drop + keyboard shortcuts cmd > and cmd <
        let cards = board.cards.sorted(by: { (first: Card, second: Card) -> Bool in first.createdAt < second.createdAt })
        NavigationStack {
            Spacer()
            Text(board.title).font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
            Spacer()
            ScrollView {
                HStack {
                    BoardColumnView(cards: cards, state: "Backlog")
                    BoardColumnView(cards: cards, state: "Doing")
                    BoardColumnView(cards: cards, state: "Review")
                    BoardColumnView(cards: cards, state: "Done")
                }
            }
        }.toolbar {
            ToolbarItemGroup {
                Button(action: addCard) {
                    Label("Add Card", systemImage: "plus")
                }.keyboardShortcut("c")
                Button(role: .destructive, action: deleteCard) {
                    Label("Delete Card", systemImage: "trash")
                }.keyboardShortcut(.delete)
            }
        }.sheet(isPresented: $isAddingCard) {
            CardEditorView(board: board, isPresented: $isAddingCard)
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/ .defaultAction/*@END_MENU_TOKEN@*/)
    }
    
    private func addCard() {
        isAddingCard = true
    }
    
    private func deleteCard() {
        // TODO: implement functionality
    }
    
    // TODO: edit card functionality
}

// #Preview {
//    BoardView()
// }
