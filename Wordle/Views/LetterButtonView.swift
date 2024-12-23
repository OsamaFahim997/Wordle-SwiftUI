//
//  LetterButtonView.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

struct LetterButtonView: View {
    
    @EnvironmentObject var dm: WordleViewModel
    
    var letter: String
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    LetterButtonView(letter: "A")
        .environmentObject(WordleViewModel())
}
