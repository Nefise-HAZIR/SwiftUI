//
//  HomeScreenViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import CoreData
class HomeScreenViewModel : ObservableObject{
     @Published var personsList=[KisilerModel]()
    let context = persistentContainer.viewContext
    
    func downloadPersons () {
        do {
          let list =  try context.fetch(KisilerModel.fetchRequest())
            personsList = list
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func search(word:String){
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", word)
          let list =  try context.fetch(fr)
            personsList = list
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func remove(person:KisilerModel){
        context.delete(person)
        saveContext()
        downloadPersons()
    }
}
