//
//  Board.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-13.
//

import Foundation
import SwiftData

@Model
final class Board {
    @Attribute(.unique) var id: UUID
    var title: String
    var timestamp: Date
    @Relationship(deleteRule: .cascade, inverse: \Card.board)
    var cards = [Card]()

    init(title: String, timestamp: Date = Date(), cards: [Card] = []) {
        self.id = UUID()
        self.title = title
        self.timestamp = timestamp
        self.cards = cards
    }
}
