//
//  PersonRegisterViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import Firebase

class PersonRegisterViewModel {
    var refPersons = Database.database().reference().child("kisiler")

    
    func save(person_name:String,person_phone:String){
        let newPerson = ["kisi_id":"","kisi_ad":person_name,"kisi_tel":person_phone]
        refPersons.childByAutoId().setValue(newPerson)
    }
}
