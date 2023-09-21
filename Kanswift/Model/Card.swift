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
    var cardTitle: String
    var cardDescription: String
    var cardState: String
    var createdAt: Date
    var dueDate: Date

    init(cardTitle: String = "", cardDescription: String = "", cardState: String = "Backlog", createdAt: Date = Date(), dueDate: Date) {
        self.id = UUID()
        self.cardTitle = cardTitle
        self.cardDescription = cardDescription
        self.cardState = cardState
        self.createdAt = createdAt
        self.dueDate = dueDate
    }
}
