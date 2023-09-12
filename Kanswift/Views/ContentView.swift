//
//  ContentView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Card.timestamp, animation: .smooth) private var cards: [Card]
    
    @State private var isAddingCard = false
    @State private var selectedCard: Card?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedCard) {
                ForEach(cards) { card in
                    NavigationLink {
                        Text(card.cardDescription)
                    } label: {
                        Text(card.cardDescription)
                        Text(card.cardState).foregroundStyle(.blue)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 220)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: addCard) {
                        Label("Add", systemImage: "plus")
                    }
                    Button(action: deleteCard) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $isAddingCard) {
            CardEditor(isPresented: $isAddingCard)
        }
    }

    private func addCard() {
        isAddingCard = true
    }
    
    // TODO: fix deleteCard functionality
    private func deleteCard() {
        if let selectedCard = selectedCard {
            withAnimation {
                modelContext.delete(selectedCard)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
