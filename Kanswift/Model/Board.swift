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
    var title: String
    var timestamp: Date
    var cards: [Card]
    
    init(title: String, timestamp: Date = Date(), cards: [Card] = []) {
        self.title = title
        self.timestamp = timestamp
        self.cards = cards
    }
}
