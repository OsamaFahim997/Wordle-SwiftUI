//
//  Color+Extenstion.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

extension Color {
    
    static var wrong: Color {
        Color(UIColor(named: "wrong-asset")!)
    }
    
    static var correct: Color {
        Color(UIColor(named: "correct-asset")!)
    }
    
    static var misplaced: Color {
        Color(UIColor(named: "misplaced-asset")!)
    }
    
    static var unused: Color {
        Color(UIColor(named: "unused-asset")!)
    }
    
    static var systemBackground: Color {
        Color(.systemBackground)
    }
    
}

