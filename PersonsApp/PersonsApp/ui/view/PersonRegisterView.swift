//
//  PersonRegisterView.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI

struct PersonRegisterView: View {
    @State private var tfName=""
    @State private var tfPhone=""
    
  var viewModel = PersonRegisterViewModel()
    var body: some View {
        VStack(spacing:100){
            TextField("Name : ", text: $tfName).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Phone : ", text: $tfPhone).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Save"){
                viewModel.save(person_name: tfName, person_phone: tfPhone)
            }
        }.navigationTitle("Register Page")
    }
}

#Preview {
    PersonRegisterView()
}
