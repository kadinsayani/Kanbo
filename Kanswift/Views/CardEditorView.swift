//
//  CardEditor.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftData
import SwiftUI

struct CardEditorView: View {
    @Environment(\.modelContext) private var modelContext

    var board: Board
    @Binding var isPresented: Bool
    @State private var cardTitle = ""
    @State private var cardDescription = ""
    @State private var dueDate = Date()
    @State private var cardStates = ["Backlog", "Doing", "Review", "Done"]
    @State private var selectedCardState = "Backlog"

    var body: some View {
        VStack {
            Spacer()
            Text("Add Card").font(.title)
            Spacer()
            TextField("Card title", text: $cardTitle, axis: .vertical).padding(10).frame(height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)).padding(10)
            Spacer()
            TextField("Card description", text: $cardDescription, axis: .vertical).padding(10).frame(height: 200)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)).padding(10)
            Spacer()
            DatePicker("Due Date: ", selection: $dueDate, displayedComponents: [.date, .hourAndMinute]).datePickerStyle(.graphical).padding(10)
            Spacer()
            Picker("State: ", selection: $selectedCardState) {
                ForEach(cardStates, id: \.self) { state in
                    Text(state)
                }
            }.pickerStyle(.palette).padding(10)
            Spacer()
            Button("Save") {
                withAnimation {
                    let newCard = Card(cardTitle: cardTitle, cardDescription: cardDescription, cardState: selectedCardState, createdAt: Date(), dueDate: dueDate)
                    board.cards.append(newCard)
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    isPresented = false
                }
            }
            Spacer()
        }
        .frame(width: 400, height: 700)
    }
}

// #Preview() {
//    CardEditorView(isPresented: .constant(true))
// }
