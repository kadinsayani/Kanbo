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
    @Query private var cards: [Card]
    
    @State private var isAddingCard = false
//    @State private var selectedCard: Card

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(cards) { card in
                    NavigationLink {
                        Text(card.cardDescription)
                    } label: {
                        Text(card.cardDescription)
                        Text(card.cardState).foregroundStyle(.blue)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: addCard) {
                        Label("Add Item", systemImage: "plus")
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
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
