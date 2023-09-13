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
    
    init(title: String, timestamp: Date = Date()) {
        self.title = title
        self.timestamp = timestamp
    }
}
