//
//  Board.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-12.
//

import SwiftUI

struct BoardView: View {
    @State private var isAddingCard = false
    //    @State private var selectedCard: Card?
    
    var board: Board
    
    var body: some View {
        NavigationStack {
            HStack {
                List() {
                    ForEach(board.cards) { card in
                        CardView(card: card)
                    }
                }
            }
        }.toolbar {
            ToolbarItemGroup {
                Button(action: addCard) {
                    Label("Add Card", systemImage: "plus")
                }
                Button(action: deleteCard) {
                    Label("Delete Card", systemImage: "trash")
                }
            }
        }.sheet(isPresented: $isAddingCard) {
            CardEditorView(board: board, isPresented: $isAddingCard)
        }
    }
    
    private func addCard() {
        isAddingCard = true
    }
    
    private func deleteCard() {
        
    }
}

//#Preview {
//    BoardView()
//}
