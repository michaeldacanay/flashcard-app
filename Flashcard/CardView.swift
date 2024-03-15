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
    
    var body: some View {
        ZStack {

            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isShowingQuestion ? Color.blue.gradient : Color.indigo.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)

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
