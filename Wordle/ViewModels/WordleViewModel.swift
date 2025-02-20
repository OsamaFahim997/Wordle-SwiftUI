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
    var gameOver = false
    
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
        tryIndex = 0
        gameOver = false
        print("SElected word is \(selectedWord)")
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
        guard currentWord != selectedWord else {
            gameOver = true
            setCurrentGuessColors()
            print("You won")
            return
        }
        if verifyWord() {
            setCurrentGuessColors()
            tryIndex += 1
            currentWord = ""
            if tryIndex == 6 {
                gameOver = true
                inPlay = false
                print("You lose")
            }
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
    
    private func setCurrentGuessColors() {
        let correctLetters = selectedWord.map({ String($0) })
        
        var frequency = [Character: Int]()
        for letter in selectedWord {
            frequency[letter, default: 0] += 1
        }
        
        for index in 0 ... 4 {
            let letter = correctLetters[index]
            let guessedLetter = guesses[tryIndex].guessLetters[index]
            
            if letter == guessedLetter, frequency[Character(guessedLetter)] != 0 {
                guesses[tryIndex].bgColors[index] = .correct
                keyColors[guessedLetter] = .correct
                frequency[Character(guessedLetter)]! -= 1
            } else if selectedWord.contains(guessedLetter), frequency[Character(guessedLetter)] != 0 {
                keyColors[guessedLetter] = .misplaced
                guesses[tryIndex].bgColors[index] = .misplaced
            } else {
                keyColors[guessedLetter] = .wrong
                guesses[tryIndex].bgColors[index] = .wrong
            }
        }
        
        flipCards(for: tryIndex)
    }
    
    func flipCards(for row: Int) {
        for col in 0 ... 4 {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.guesses[row].flippedCards[col].toggle()
            })
        }
    }
}
