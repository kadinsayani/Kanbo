//
//  WelcomeView.swift
//  Kanbo
//
//  Created by Kadin Sayani on 2023-10-05.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome to Kanbo").font(.title).padding()
        Spacer()
        Text("\"Knowing is not enough, we must apply. Willing is not enough, we must do.\" - Bruce Lee").font(.headline)
        Spacer()
        VStack(alignment: .leading) {
            ForEach(commands) { command in
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: 50, height: 50).opacity(0.5)
                        Text("⌘\(command.key)").padding()
                    }
                    Text("\(command.name)").padding()
                }
            }
        }
        Spacer()
        Button(action: { UserDefaults.standard.set(true, forKey: "hasLaunched") }) {
            Text("Continue").font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }.buttonStyle(PlainButtonStyle()).padding()
    }
}

#Preview {
    WelcomeView()
}
