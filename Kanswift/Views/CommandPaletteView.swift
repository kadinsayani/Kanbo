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
        TextField("Search for a command", text: $command)
    }
}

// #Preview {
//    CommandPaletteView(showingCommandPalette: $showingCommandPalette, command: "")
// }
