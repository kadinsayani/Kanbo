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
    @Environment(\.dismiss) private var dismiss

    var board: Board
    @Bindable var card: Card
    @Binding var isPresented: Bool
    @State private var cardStates = ["Backlog", "Doing", "Review", "Done"]

    var body: some View {
        VStack {
            Spacer()
            TextField("Card title", text: $card.cardTitle, axis: .vertical).padding(10).frame(height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)).padding(10).font(.title)
            Spacer()
            TextField("Card description", text: $card.cardDescription, axis: .vertical).padding(10).frame(height: 200)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)).padding(10)
            Spacer()
            DatePicker("Due Date: ", selection: $card.dueDate, displayedComponents: [.date, .hourAndMinute]).datePickerStyle(.graphical).padding(10)
            Spacer()
            Picker("State: ", selection: $card.cardState) {
                ForEach(cardStates, id: \.self) { state in
                    Text(state)
                }
            }.pickerStyle(.palette).padding(10)
            Spacer()
            Button("Save") {
                withAnimation {
                    board.cards.append(card)
                    isPresented = false
                    dismiss()
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
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
