//
//  Board.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-12.
//

import SwiftData
import SwiftUI

struct BoardView: View {
    @Environment(\.modelContext) private var modelContext

    var board: Board
    @State var cards: [Card]

    @State private var isPresented = false
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
                    BoardColumnView(board: board, cards: cards, state: "Backlog")
                    BoardColumnView(board: board, cards: cards, state: "Doing")
                    BoardColumnView(board: board, cards: cards, state: "Review")
                    BoardColumnView(board: board, cards: cards, state: "Done")
                }
            }
        }.toolbar {
            ToolbarItemGroup {
                Button(action: addCard) {
                    Label("Add Card", systemImage: "plus")
                }.keyboardShortcut("c")
            }
        }.sheet(isPresented: $isPresented) {
            let newCard = Card(cardTitle: "", cardDescription: "", cardState: "Backlog", createdAt: Date(), dueDate: Date())
            CardEditorView(board: board, card: newCard, isPresented: $isPresented)
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/ .defaultAction/*@END_MENU_TOKEN@*/)
    }

    private func addCard() {
        isPresented = true
    }
}

// #Preview {
//    BoardView()
// }
