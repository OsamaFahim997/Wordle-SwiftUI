//
//  WordleViewModel.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

class WordleViewModel: ObservableObject {
    
    @Published var guesses: [GuessModel] = []
    
    var keyColors = [String: Color]()
    
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
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
}
