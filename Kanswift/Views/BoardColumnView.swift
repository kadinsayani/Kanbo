//
//  BoardColumnView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-17.
//

import SwiftUI

struct BoardColumnView: View {
    var cards: [Card]
    var state: String

    var body: some View {
        ScrollView {
            LazyVStack {
                Text(state).font(.title)
                ForEach(cards.filter { $0.cardState == state }) { card in
                    CardView(card: card)
                }
            }
            Spacer()
        }
    }
}

// #Preview {
//    BoardColumnView()
// }
