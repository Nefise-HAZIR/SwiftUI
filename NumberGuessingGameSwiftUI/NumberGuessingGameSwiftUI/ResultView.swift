//
//  ResultView.swift
//  NumberGuessingGameSwiftUI
//
//  Created by Nefise Hazır on 16.01.2025.
//

import SwiftUI

struct ResultView: View {
    var result = false
    var body: some View {
        VStack(spacing:100) {
            if result {
                Text("Kazandınız").font(.system(size: 36))
                Image("mutlu").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            }else{
                Text("Kaybettiniz").font(.system(size: 36))
                Image("uzgun").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            }
           
           
          
        }
    }
}

#Preview {
    ResultView()
}
