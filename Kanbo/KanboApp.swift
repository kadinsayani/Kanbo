//
//  KanboApp.swift
//  Kanbo
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftData
import SwiftUI

@main
struct KanboApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Card.self,
            Board.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true

    var body: some Scene {
        WindowGroup {
            ContentView().frame(minWidth: 900, minHeight: 450)
        }
        .modelContainer(sharedModelContainer)
        .commands {
            TextEditingCommands()
        }
#if os(macOS)
        MenuBarExtra("Kanbo Menu Bar Extra", systemImage: "rectangle.split.3x1", isInserted: $showMenuBarExtra) {
            StatusMenu().modelContainer(sharedModelContainer)
        }.menuBarExtraStyle(.window)
#endif
    }
}
