//
//  CardEditor.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI
import SwiftData

struct BoardEditorView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresented: Bool
    @State private var title = ""
    
    var body: some View {
            VStack {
                TextField("Board Title", text: $title).padding(10)
                
                Button("Save") {
                    let newBoard = Board(title: title, timestamp: Date(), cards: [])
                    modelContext.insert(newBoard)
                    isPresented = false
                }
                .padding()
            }
            .frame(width: 300, height: 150)
    }
}

//#Preview() {
//    CardEditorView(isPresented: .constant(true))
//}
