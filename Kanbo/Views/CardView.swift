//
//  CardView.swift
//  Kanbo
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI

struct CardView: View {
    @Environment(\.modelContext) private var modelContext

    var card: Card
    @State private var overButton = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).stroke(Color(card.color), lineWidth: 1).frame(width: 200)
            HStack {
                Button(action: backState) {
                    Image(systemName: "arrow.left").opacity(overButton ? 1 : 0)
                }.buttonStyle(PlainButtonStyle()).padding(1)
                Spacer()
                Button(action: forwardState) {
                    Image(systemName: "arrow.right").opacity(overButton ? 1 : 0)

                }.buttonStyle(PlainButtonStyle()).padding(1)
            }.frame(width: 200)
            Text(card.cardTitle).font(.headline).frame(maxWidth: 200, minHeight: 100).lineLimit(nil)
            Rectangle()
                .frame(width: 200)
                .opacity(0.000000001)
        }.onHover { over in
            overButton = over
        }.onAppear { updateColors() }
    }

    private func forwardState() {
        withAnimation {
            switch card.cardState {
                case "Backlog":
                    card.cardState = "Doing"
                    card.color = "kanswift.purple"
                case "Doing":
                    card.cardState = "Review"
                    card.color = "kanswift.white"
                case "Review":
                    card.cardState = "Done"
                    card.color = "kanswift.cyan"
                default:
                    card.cardState = "Backlog"
                    card.color = "kanswift.orange"
            }
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func backState() {
        withAnimation {
            switch card.cardState {
                case "Doing":
                    card.cardState = "Backlog"
                    card.color = "kanswift.orange"
                case "Review":
                    card.cardState = "Doing"
                    card.color = "kanswift.purple"
                case "Done":
                    card.cardState = "Review"
                    card.color = "kanswift.white"
                default:
                    card.cardState = "Backlog"
                    card.color = "kanswift.orange"
            }
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func updateColors() {
        switch card.cardState {
            case "Backlog":
                card.color = "kanswift.orange"
            case "Doing":
                card.color = "kanswift.purple"
            case "Review":
                card.color = "kanswift.white"
            case "Done":
                card.color = "kanswift.cyan"
            default:
                card.color = "kanswift.orange"
        }
    }
}

// #Preview {
//    CardView()
// }
