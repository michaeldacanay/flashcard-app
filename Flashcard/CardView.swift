//
//  CardView.swift
//  Flashcard
//
//  Created by Michael Dacanay on 3/14/24.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    @State private var isShowingQuestion = true
    
    @State private var offset: CGSize = .zero // <-- A state property to store the offset
    
    private let swipeThreshold: Double = 200 // <--- Define a swipeThreshold constant top level
    
    var body: some View {
        ZStack {

            // Card background
            ZStack { //<-- Wrap existing card background in ZStack in order to position another background behind it

                // Back-most card background
                RoundedRectangle(cornerRadius: 25.0) // <-- Add another card background behind the original
                    .fill(offset.width < 0 ? .red : .green) // <-- Set fill based on offset (swipe left vs right)

                // Front-most card background (i.e. original background)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(isShowingQuestion ? Color.blue.gradient : Color.indigo.gradient)
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .opacity(1 - abs(offset.width) / swipeThreshold) // <-- Fade out front-most background as user swipes
            }

            VStack(spacing: 20) {

                // Card type (question vs answer)
                Text(isShowingQuestion ? "Question" : "Answer")
                    .bold()
                
                // Separator
                Rectangle()
                    .frame(height: 1)

                // Card text
                Text(isShowingQuestion ? card.question : card.answer)
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 300, height: 500)
        .onTapGesture {
            isShowingQuestion.toggle()
        }
        .opacity(3 - abs(offset.width) / swipeThreshold * 3) // <-- Fade the card out as user swipes, beginning fade in the last 1/3 to the threshold
        .rotationEffect(.degrees(offset.width / 20.0)) // <-- Add rotation when swiping
        .offset(CGSize(width: offset.width, height: 0)) // <-- Use the offset value to set the offset of the card view
        .gesture(DragGesture()
            .onChanged { gesture in // <-- onChanged called for every gesture value change, like when the drag translation changes
                let translation = gesture.translation // <-- Get the current translation value of the gesture. (CGSize with width and height)
                print(translation) // <-- Print the translation value
                offset = translation // <-- update the state offset property as the gesture translation changes
            }
        )
    }
}

// Card data model
struct Card {
    let question: String
    let answer: String
    
    static let mockedCards = [
        Card(question: "Located at the southern end of Puget Sound, what is the capitol of Washington?", answer: "Olympia"),
        Card(question: "Which city serves as the capital of Texas?", answer: "Austin"),
        Card(question: "What is the capital of New York?", answer: "Albany"),
        Card(question: "Which city is the capital of Florida?", answer: "Tallahassee"),
        Card(question: "What is the capital of Colorado?", answer: "Denver")
    ]
}

#Preview {
    CardView(
//        initialize it with a card
        card: Card(
            question: "Located at the southern end of Puget Sound, what is the capitol of Washington?",
            answer: "Olympia"))
}
