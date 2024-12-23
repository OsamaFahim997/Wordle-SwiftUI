//
//  KeyboardView.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

struct KeyboardView: View {
    
    @EnvironmentObject var dm: WordleViewModel
    var firstRowArray = "QWERTYUIOP".map({String($0)})
    var secondRowArray = "ASDFGHJKL".map({String($0)})
    var thirdRowArray = "ZXCVBNM".map({String($0)})
    var keyboardRows: [[String]] {
        return [firstRowArray, secondRowArray, thirdRowArray]
    }
    
    
    var body: some View {
        VStack {
            HStack (spacing: 2, content: {
                ForEach(firstRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
            })
            
            HStack (spacing: 2, content: {
                ForEach(secondRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
            })
            
            HStack (spacing: 2, content: {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Enter")
                })
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(.unusedAsset)
                
                ForEach(thirdRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "delete.backward.fill")
                })
                .font(.system(size: 20))
                .frame(width: 40, height: 50)
                .foregroundColor(.primary)
                .background(.unusedAsset)
            })
        }
    }
}

#Preview {
    KeyboardView()
        .environmentObject(WordleViewModel())
        .scaleEffect(Global.keyboardScale)
}
