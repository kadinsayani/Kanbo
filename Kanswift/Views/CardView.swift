//
//  CardView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        let color: String = switch(card.cardState) {
        case "Backlog":
            "kanswift.orange"
        case "Doing":
            "kanswift.purple"
        case "Done":
            "kanswift.cyan"
        case "Review":
            "kanswift.white"
        default:
            "kanswift.orange"
        }
        ZStack {
            RoundedRectangle(cornerRadius: 5).stroke(Color(color), lineWidth: 1).frame(width: 150, height: 100)
            Text(card.cardDescription)
        }
    }
}

//#Preview {
//    CardView()
//}
