//
//  PersonDetailViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import CoreData
class PersonDetailViewModel {
   
    func update(person:KisilerModel,person_name:String,person_phone:String){
        person.kisi_ad = person_name
        person.kisi_tel = person_phone
        saveContext()
    }
}
