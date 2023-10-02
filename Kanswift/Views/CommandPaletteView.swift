//
//  CommandPaletteView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-10-01.
//

import SwiftUI

struct CommandPaletteView: View {
    @Binding var showingCommandPalette: Bool
    @State var command: String

    var body: some View {
        // TODO:
        TextField("Search for a command", text: $command).padding(5)
    }
}

// #Preview {
//    CommandPaletteView(showingCommandPalette: $showingCommandPalette, command: "")
// }
