//
//  GuessModel.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

struct GuessModel {
    
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var flippedCards = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map({ String($0) })
    }
    
}
