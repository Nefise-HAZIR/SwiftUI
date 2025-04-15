//
//  PersonDetailView.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI
import CoreData
struct PersonDetailView: View {
    @State private var tfName=""
    @State private var tfPhone=""
    
    @Binding var personList:[KisilerModel]
    
    var person=KisilerModel()
   var viewModel = PersonDetailViewModel()
    var body: some View {
        VStack(spacing:100){
            TextField("Name : ", text: $tfName).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Phone : ", text: $tfPhone).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Update"){
                viewModel.update(person: person , person_name: tfName, person_phone: tfPhone)
                personList.removeAll()
                
            }
        }.navigationTitle("Person Detail").onAppear{
            tfName=person.kisi_ad!
            tfPhone=person.kisi_tel!
        }
    }
}

/*#Preview {
    PersonDetailView()
}*/
