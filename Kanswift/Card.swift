//
//  Card.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import Foundation
import SwiftData

@Model
final class Card {
    @Attribute(.unique) var id: UUID
    var cardDescription: String
    var cardState: String
    var timestamp: Date
    
    init(cardDescription: String, cardState: String, timestamp: Date = Date()) {
        self.id = UUID()
        self.cardDescription = cardDescription
        self.cardState = cardState
        self.timestamp = timestamp
    }
}
