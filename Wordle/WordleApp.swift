//
//  WordleApp.swift
//  Wordle
//
//  Created by Osama Fahim on 23/12/24.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var dm = WordleViewModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
