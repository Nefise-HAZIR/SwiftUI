//
//  GuessView.swift
//  NumberGuessingGameSwiftUI
//
//  Created by Nefise Hazır on 16.01.2025.
//

import SwiftUI

struct GuessView: View {
    @State private var gotoResultView=false
    @State private var remainingGuess=5
    @State private var orientation=""
    @State private var tfGuess=""
    @State private var randomNumber=0
    @State private var result=false
    var body: some View {
        VStack(spacing:100) {
            Text("Kalan Hak : \(remainingGuess)").font(.system(size: 36))
            Text("Yardım : \(orientation)").font(.system(size: 20))
            TextField("Tahmin",text: $tfGuess).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Tahmin Et"){
                remainingGuess = remainingGuess - 1
                if let guess = Int(tfGuess){
                    if guess == randomNumber {
                        gotoResultView=true
                        result=true
                        return
                    }
                    if guess > randomNumber {
                        orientation="Azalt"
                    }
                    if guess < randomNumber {
                        orientation="Arttır"
                    }
                    if remainingGuess == 0 {
                        gotoResultView=true
                        result=false
                        return
                    }
                }
                tfGuess="" 
            }.foregroundColor(.white).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50).padding(.horizontal).background(.blue).cornerRadius(10)
        }.navigationDestination(isPresented: $gotoResultView){
            ResultView(result: result)
        }.onAppear{
            randomNumber=Int.random(in: 0...100)
            print("rastgele sayı:\(randomNumber)")
            
            remainingGuess=5
            orientation=""
            tfGuess=""
        }
    }
}

#Preview {
    GuessView()
}
