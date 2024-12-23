//
//  GuessView.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

struct GuessView: View {
    
    @Binding var guess: GuessModel
    
    var body: some View {
        HStack(spacing: 3, content: {
            ForEach(0...4, id: \.self) { index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        })
    }
}

#Preview {
    GuessView(guess: .constant(GuessModel(index: 0)))
}