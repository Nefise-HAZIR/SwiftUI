//
//  PersonDetailView.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI

struct PersonDetailView: View {
    @State private var tfName=""
    @State private var tfPhone=""
    
    var person=Kisiler()
   var viewModel = PersonDetailViewModel()
    var body: some View {
        VStack(spacing:100){
            TextField("Name : ", text: $tfName).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Phone : ", text: $tfPhone).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Update"){
                viewModel.update(person_id:Int(person.kisi_id!)! , person_name: tfName, person_phone: tfPhone)
            }
        }.navigationTitle("Person Detail").onAppear{
            tfName=person.kisi_ad!
            tfPhone=person.kisi_tel!
        }
    }
}

#Preview {
    PersonDetailView()
}
