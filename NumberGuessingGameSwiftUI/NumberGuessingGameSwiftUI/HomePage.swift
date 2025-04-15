//
//  ContentView.swift
//  NumberGuessingGameSwiftUI
//
//  Created by Nefise Hazır on 16.01.2025.
//

import SwiftUI

struct HomePage: View {
    @State private var gotoGuessView=false
    var body: some View {
        NavigationStack {
            VStack(spacing:100) {
                Text("Tahmin Oyunu").font(.system(size: 36))
                Image("zar").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                Button("Oyuna Başla"){
                    gotoGuessView=true
                }.foregroundColor(.white).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50).padding(.horizontal).background(.blue).cornerRadius(10)
            }.navigationDestination(isPresented: $gotoGuessView, destination: {
                GuessView()
            })
        }
    }
}

#Preview {
    HomePage()
}
