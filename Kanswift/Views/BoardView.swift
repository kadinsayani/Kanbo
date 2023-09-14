//
//  Board.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-12.
//

import SwiftUI
import SwiftData

struct BoardView: View {
    @State private var isAddingCard = false
    @State private var selectedCard: Card?
    
    var board: Board
    
    var body: some View {
        let cards = board.cards.sorted(by: {(first: Card, second: Card) -> Bool in return first.timestamp < second.timestamp})
        NavigationStack {
            List(selection: $selectedCard) {
                HStack {
                    // Backlog
                    VStack {
                        ForEach(cards.filter {$0.cardState == "Backlog"}) { card in
                            CardView(card: card).onDeleteCommand(perform: {
                                deleteCard()
                            })
                        }
                    }
                    Spacer()
                    // Doing
                    VStack {
                        ForEach(cards.filter {$0.cardState == "Doing"}) { card in
                            CardView(card: card).onDeleteCommand(perform: {
                                deleteCard()
                            })
                        }
                    }
                    Spacer()
                    // Done
                    VStack {
                        ForEach(cards.filter {$0.cardState == "Done"}) { card in
                            CardView(card: card).onDeleteCommand(perform: {
                                deleteCard()
                            })
                        }
                    }
                    Spacer()
                    // Review
                    VStack {
                        ForEach(cards.filter {$0.cardState == "Review"}) { card in
                            CardView(card: card).onDeleteCommand(perform: {
                                deleteCard()
                            })
                        }
                    }
                    Spacer()
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
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/.defaultAction/*@END_MENU_TOKEN@*/)
    }
    
    private func addCard() {
        isAddingCard = true
    }
    
    private func deleteCard() {
        print("delete")
    }
}

//#Preview {
//    BoardView()
//}
