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
        let color: String = switch card.cardState {
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
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.day, .hour], from: currentDate, to: card.dueDate)

        let days = components.day ?? 0
        let hours = components.hour ?? 0

        ZStack {
            RoundedRectangle(cornerRadius: 5).stroke(Color(color), lineWidth: 1).frame(width: 150, height: 100)
            VStack {
                Spacer()
                Text(card.cardTitle).font(.headline)
                Spacer()
                Text("\(Image(systemName: "timer.circle")) \(days) days \(hours) hours")
                Spacer()
            }
            Rectangle()
                .frame(width: 150, height: 100)
                .opacity(0.000000001)
        }
    }
}

// #Preview {
//    CardView()
// }
