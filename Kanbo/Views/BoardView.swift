//
//  Board.swift
//  Kanbo
//
//  Created by Kadin Sayani on 2023-09-12.
//

import SwiftData
import SwiftUI

struct BoardView: View {
    @Environment(\.modelContext) private var modelContext

    let stateBacklog = "Backlog"
    let stateDoing = "Doing"
    let stateReview = "Review"
    let stateDone = "Done"

    var board: Board
    @State var cards: [Card]

    @State private var isPresented = false
    @State private var selectedCard: Card?

    var body: some View {
        let cards = board.cards.sorted(by: { (first: Card, second: Card) -> Bool in first.createdAt < second.createdAt })
        NavigationStack {
            Spacer()
            Text(board.title).font(.title)
            Spacer()
            ScrollView {
                HStack {
                    VStack {
                        Text(stateBacklog)
                            .font(.title)
                            .padding(.horizontal)

                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(cards.filter { $0.cardState == stateBacklog }) { card in
                                    CardView(card: card)
                                        .onTapGesture {
                                            selectedCard = card
                                            isPresented = true
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .sheet(item: $selectedCard) { card in
                        CardEditorView(board: board, card: card, isPresented: $isPresented)
                            .keyboardShortcut(.defaultAction)
                    }
                    VStack {
                        Text(stateDoing)
                            .font(.title)
                            .padding(.horizontal)

                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(cards.filter { $0.cardState == stateDoing }) { card in
                                    CardView(card: card)
                                        .onTapGesture {
                                            selectedCard = card
                                            isPresented = true
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .sheet(item: $selectedCard) { card in
                        CardEditorView(board: board, card: card, isPresented: $isPresented)
                            .keyboardShortcut(.defaultAction)
                    }
                    VStack {
                        Text(stateReview)
                            .font(.title)
                            .padding(.horizontal)

                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(cards.filter { $0.cardState == stateReview }) { card in
                                    CardView(card: card)
                                        .onTapGesture {
                                            selectedCard = card
                                            isPresented = true
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .sheet(item: $selectedCard) { card in
                        CardEditorView(board: board, card: card, isPresented: $isPresented)
                            .keyboardShortcut(.defaultAction)
                    }
                    VStack {
                        Text(stateDone)
                            .font(.title)
                            .padding(.horizontal)

                        ScrollView {
                            LazyVStack(spacing: 8) {
                                ForEach(cards.filter { $0.cardState == stateDone }) { card in
                                    CardView(card: card)
                                        .onTapGesture {
                                            selectedCard = card
                                            isPresented = true
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .sheet(item: $selectedCard) { card in
                        CardEditorView(board: board, card: card, isPresented: $isPresented)
                            .keyboardShortcut(.defaultAction)
                    }
                }
            }
        }.toolbar {
            ToolbarItemGroup {
                Button(action: addCard) {
                    Label("Add Card", systemImage: "plus")
                }.keyboardShortcut("c")
            }
        }.sheet(isPresented: $isPresented) {
            let newCard = Card(cardTitle: "", cardDescription: "", cardState: "Backlog", createdAt: Date(), dueDate: Date())
            CardEditorView(board: board, card: newCard, isPresented: $isPresented)
        }
    }

    private func addCard() {
        isPresented = true
    }
}

// #Preview {
//    BoardView()
// }
