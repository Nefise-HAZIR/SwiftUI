//
//  ContentView.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI

struct HomeScreen: View {
    @State private var searchText=""
    
    @ObservedObject var viewModel = HomeScreenViewModel()
    
    func remove(at offsets:IndexSet){
        let person=viewModel.personsList[offsets.first!]
        //viewModel.personsList.remove(at: offsets.first!)
        viewModel.remove(person_id: person.kisi_id!)
       
    }
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.personsList){ person in
                    NavigationLink( destination: PersonDetailView(person: person)){
                        PersonRow(person: person)
                    }
                }.onDelete(perform:remove)
            }.navigationTitle("Persons").toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: PersonRegisterView()){
                        Image(systemName: "plus")
                    }
                }
            }.onAppear{
                viewModel.downloadPersons()
                
            }
        }.searchable(text: $searchText,prompt: "Search")
            .onChange(of: searchText){s in
                if s == ""{
                    viewModel.downloadPersons()
                }else{
                    viewModel.search(word: s)
                }
               
                
            }
    }
    


}

#Preview {
    HomeScreen()
}
