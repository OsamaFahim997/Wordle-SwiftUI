 //
//  ContentView.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dm: WordleViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 3, content: {
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[1])
                GuessView(guess: $dm.guesses[2])
                GuessView(guess: $dm.guesses[3])
                GuessView(guess: $dm.guesses[4])
                GuessView(guess: $dm.guesses[5])
            })
            .frame(width: Global.boardWidth, height: 6 * (Global.boardWidth / 5))
                .navigationViewStyle(.stack)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {}, label: {
                            Image(systemName: "questionmark.circle")
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("WORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primary)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "chart.bar")
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "gearshape.fill")
                            })
                        }
                    }
                })
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    GameView()
        .environmentObject(WordleViewModel())
}
