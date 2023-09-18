//
//  StatusMenu.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-17.
//

import SwiftData
import SwiftUI

struct StatusMenu: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Board.timestamp) private var boards: [Board]

    var body: some View {
        VStack {
            Text("Kanswift").font(.headline).padding(10)
            HStack {
                Text("Boards").underline()
                Spacer()
            }.padding(.leading, 10)
            ForEach(boards) { board in
                HStack {
                    BoardStatesView(board: board)
                }.padding(10)
            }
        }
    }
}

// #Preview {
//    StatusMenu()
// }
