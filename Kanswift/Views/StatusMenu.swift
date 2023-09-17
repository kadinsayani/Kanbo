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
        VStack {
            Text("Kanswift").font(.headline).padding(10)
            HStack {
                Text("Boards").underline()
                Spacer()
            }.padding(.leading, 10)
            ForEach(boards) { board in
                HStack {
                    Text("\(board.title)")
                    Spacer()
                    let backlogCount = board.cards.filter({$0.cardState == "Backlog"}).count
                    let backlogCountText = Text("\(backlogCount)").foregroundStyle(Color("kanswift.orange"))
                    let doingCount = board.cards.filter({$0.cardState == "Doing"}).count
                    let doingCountText = Text("\(doingCount)").foregroundStyle(Color("kanswift.purple"))
                    let doneCount = board.cards.filter({$0.cardState == "Done"}).count
                    let doneCountText = Text("\(doneCount)").foregroundStyle(Color("kanswift.cyan"))
                    let reviewCount = board.cards.filter({$0.cardState == "Review"}).count
                    let reviewCountText = Text("\(reviewCount)").foregroundStyle(Color("kanswift.white"))
                    Text("\(backlogCountText) | \(doingCountText) | \(doneCountText) | \(reviewCountText)")
                }.padding(10)
            }
        }
    }
}

//#Preview {
//    StatusMenu()
//}
