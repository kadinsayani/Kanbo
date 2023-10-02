//
//  File.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-10-01.
//

import Foundation
import SwiftData
import SwiftUI

class NavigationContext: ObservableObject {
    @Published var selectedBoardName: String?
    @Published var selectedBoard: Board?

    var sidebarTitle = "Boards"

    var contentListTitle: String {
        if let selectedBoardName {
            selectedBoardName
        } else {
            ""
        }
    }

    init(selectedBoardName: String? = nil,
         selectedBoard: Board? = nil)
    {
        self.selectedBoardName = selectedBoardName
        self.selectedBoard = selectedBoard
    }
}
