//
//  PersonRegisterViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
class PersonRegisterViewModel {
    let context = persistentContainer.viewContext
    
    func save(person_name:String,person_phone:String){
      let kisi = KisilerModel(context: context)
        kisi.kisi_ad=person_name
        kisi.kisi_tel=person_phone
        saveContext()
    }
}
