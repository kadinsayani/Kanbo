//
//  Card.swift
//  Kanbo
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
    var startDate: Date
    var dueDate: Date
    var board: Board?
    var color: String

    init(cardTitle: String = "", cardDescription: String = "", cardState: String = "Backlog", createdAt: Date = Date(), startDate: Date = Date(), dueDate: Date) {
        self.id = UUID()
        self.cardTitle = cardTitle
        self.cardDescription = cardDescription
        self.cardState = cardState
        self.createdAt = createdAt
        self.startDate = startDate
        self.dueDate = dueDate
        self.color = switch cardState {
        case "Backlog":
            "kanswift.orange"
        case "Doing":
            "kanswift.purple"
        case "Review":
            "kanswift.white"
        case "Done":
            "kanswift.cyan"
        default:
            "kanswift.orange"
        }
    }
}
