//
//  BoardStatesView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-17.
//

import SwiftUI

struct BoardStatesView: View {
    var board: Board

    var body: some View {
        Text("\(board.title)")
        Spacer()
        let backlogCount = board.cards.filter { $0.cardState == "Backlog" }.count
        let backlogCountText = Text("\(backlogCount)").foregroundStyle(Color("kanswift.orange"))
        let doingCount = board.cards.filter { $0.cardState == "Doing" }.count
        let doingCountText = Text("\(doingCount)").foregroundStyle(Color("kanswift.purple"))
        let reviewCount = board.cards.filter { $0.cardState == "Review" }.count
        let reviewCountText = Text("\(reviewCount)").foregroundStyle(Color("kanswift.white"))
        let doneCount = board.cards.filter { $0.cardState == "Done" }.count
        let doneCountText = Text("\(doneCount)").foregroundStyle(Color("kanswift.cyan"))
        Text("\(backlogCountText) | \(doingCountText) | \(reviewCountText) | \(doneCountText)")
    }
}

// #Preview {
//    BoardStatesView()
// }
