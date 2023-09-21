//
//  BoardColumnView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-17.
//

import SwiftUI

struct BoardColumnView: View {
    var board: Board
    var cards: [Card]
    var state: String

    @State private var selectedCard: Card?
    @State var isPresented = false

    var body: some View {
        ScrollView {
            LazyVStack {
                Text(state).font(.title)
                ForEach(cards.filter { $0.cardState == state }) { card in
                    CardView(card: card).onTapGesture { selectedCard = card; isPresented = true }
                }
            }
            Spacer()
        }.sheet(item: $selectedCard) { card in
            CardEditorView(board: board, card: card, isPresented: $isPresented)
        }.keyboardShortcut(/*@START_MENU_TOKEN@*/ .defaultAction/*@END_MENU_TOKEN@*/)
    }
}

// #Preview {
//    BoardColumnView()
// }
