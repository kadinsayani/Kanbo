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
