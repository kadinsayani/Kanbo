//
//  CardEditor.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI
import SwiftData

struct CardEditor: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresented: Bool
    @State private var cardDescription = ""
    @State private var cardStates = ["Backlog", "Doing", "Review", "Done"]
    @State private var selectedCardState = "Backlog"
    
    var body: some View {
            VStack {
                TextField("Card Description", text: $cardDescription).padding(10)
                
                Picker("State: ", selection: $selectedCardState) {
                    ForEach(cardStates, id: \.self) { state in
                        Text(state)
                    }
                }.padding(10)
                
                Button("Save") {
                    let newCard = Card(cardDescription: cardDescription, cardState: selectedCardState, timestamp: Date())
                    modelContext.insert(newCard)
                    isPresented = false
                }
                .padding()
            }
            .frame(width: 300, height: 150)
    }
}

#Preview() {
    CardEditor(isPresented: .constant(true))
}
