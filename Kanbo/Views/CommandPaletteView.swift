//
//  CommandPaletteView.swift
//  Kanbo
//
//  Created by Kadin Sayani on 2023-10-01.
//

import SwiftUI

struct Command: Identifiable {
    var id: UUID
    let name: String
    let action: () -> Void
    let key: String
}

let commands = [
    Command(id: UUID(), name: "Create Board", action: { createBoard() }, key: "B"),
    Command(id: UUID(), name: "Add Card", action: { addCard() }, key: "C"),
]

struct CommandPaletteView: View {
    @Binding var showingCommandPalette: Bool
    @State var command: String

    var body: some View {
        // TODO: fix implementation
        VStack {
            Spacer()
            TextField("Search for a command", text: $command).padding(10).frame(width: 500, height: 30)
                .textFieldStyle(PlainTextFieldStyle())
                .cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)).padding(10).font(.headline)
            Spacer()
            List(commands, id: \.name) { cmd in
                Button(action: {
                    cmd.action()
                    showingCommandPalette = false
                }) {
                    Text(cmd.name).font(.subheadline)
                }
            }.listStyle(PlainListStyle())
            Spacer()
        }
    }
}

private func createBoard() {
    print("create")
}

private func addCard() {
    print("add")
}

// #Preview {
//    CommandPaletteView(showingCommandPalette: $showingCommandPalette, command: "")
// }
