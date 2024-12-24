//
//  WordleViewModel.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

class WordleViewModel: ObservableObject {
    
    @Published var guesses: [GuessModel] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay: Bool = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        startNewGame()
    }
    
    func startNewGame() {
        populateDefaults()
        selectedWord = Global.commonwords.randomElement()!
        currentWord = ""
        inPlay = true
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
    
    //MARK: - Game Play
    func addLetterToCurrentWord(letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if verifyWord() {
            print("Valid word")
        } else {
            withAnimation {
                self.incorrectAttempts[tryIndex] += 1
            }
            self.incorrectAttempts[tryIndex] = 0
        }
    }
    
    func removeLetterFromCurrentRow() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
}
