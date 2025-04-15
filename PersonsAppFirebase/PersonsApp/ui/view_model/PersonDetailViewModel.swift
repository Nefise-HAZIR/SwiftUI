//
//  PersonDetailViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import Firebase

class PersonDetailViewModel {
    var refPersons = Database.database().reference().child("kisiler")

    func update(person_id:String,person_name:String,person_phone:String){
        let updatedPerson = ["kisi_ad":person_name,"kisi_tel":person_phone]
        refPersons.child(person_id).updateChildValues(updatedPerson)
    }
}
