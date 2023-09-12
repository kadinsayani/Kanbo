//
//  CardView.swift
//  Kanswift
//
//  Created by Kadin Sayani on 2023-09-11.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).stroke(.blue, lineWidth: 1).frame(width: 150, height: 150)
        }
    }
}

#Preview {
    CardView()
}
