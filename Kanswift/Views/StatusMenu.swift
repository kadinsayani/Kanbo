//
//  StatusMenu.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-17.
//

import SwiftUI
import SwiftData

struct StatusMenu: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Board.timestamp) private var boards: [Board]
    
    var body: some View {
        Text("Kanswift")
        // TODO: show boards, mini ui
        ForEach(boards) { board in
            Text("\(board.title)")
        }
    }
}

#Preview {
    StatusMenu()
}
