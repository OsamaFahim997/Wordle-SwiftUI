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
            VStack {
                Spacer()
                VStack(spacing: 3, content: {
                    ForEach(0...5, id: \.self) { index in
                        GuessView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index]) ))
                    }
                })
                .frame(width: Global.boardWidth, height: 6 * (Global.boardWidth / 5))
                
                Spacer()
                KeyboardView()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                
                Spacer()
            }
            
            
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
