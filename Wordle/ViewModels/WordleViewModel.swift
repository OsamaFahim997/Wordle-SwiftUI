//
//  WordleViewModel.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

class WordleViewModel: ObservableObject {
    
    @Published var guesses: [GuessModel] = []
    
    init() {
        startNewGame()
    }
    
    func startNewGame() {
        populateDefaults()
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(GuessModel(index: index))
        }
    }
    
}
