//
//  ContentView.swift
//  Flashcard
//
//  Created by Michael Dacanay on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.blue.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)

            VStack(spacing: 20) {

                // Card type (question vs answer)
                Text("Question")
                    .bold()
                
                // Separator
                Rectangle()
                    .frame(height: 1)

                // Card text
                Text("Located at the southern end of Puget Sound, what is the capitol of Washington?")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 300, height: 500)
        
    }
}

#Preview {
    ContentView()
}
