//
//  Item.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
