//
//  BoardColumnView.swift
//  Kanbo
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
        VStack {
            Text(state)
                .font(.title)
                .padding(.horizontal)

            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(cards.filter { $0.cardState == state }) { card in
                        CardView(card: card)
                            .onTapGesture {
                                selectedCard = card
                                isPresented = true
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(item: $selectedCard) { card in
            CardEditorView(board: board, card: card, isPresented: $isPresented)
                .keyboardShortcut(.defaultAction)
        }
    }
}

// #Preview {
//    BoardColumnView()
// }
