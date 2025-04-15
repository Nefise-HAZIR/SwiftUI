//
//  HomeScreenViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import Firebase
class HomeScreenViewModel : ObservableObject{
    @Published var personsList=[Kisiler]()
    var refPersons = Database.database().reference().child("kisiler")
    
    func downloadPersons () {
       
       
        refPersons.observe(.value, with: { snapshot in
            var list=[Kisiler]()
            if let gelenveri = snapshot.value as? [String:Any] {
                for satir in gelenveri {
                    if let d = satir.value as? NSDictionary {
                        let person_id = satir.key
                        let person_name = d["kisi_ad"] as? String ?? ""
                        let person_phone = d["kisi_tel"] as? String ?? ""
                        
                        let person = Kisiler(kisi_id: person_id, kisi_ad: person_name, kisi_tel: person_phone)
                        list.append(person)
                    }
                }
            }
            DispatchQueue.main.async {
                self.personsList=list
            }
            
        })
      
        
       
    }
    
    func search(word:String){
        refPersons.observe(.value, with: { snapshot in
            var list=[Kisiler]()
            if let gelenveri = snapshot.value as? [String:Any] {
                for satir in gelenveri {
                    if let d = satir.value as? NSDictionary {
                        let person_id = satir.key
                        let person_name = d["kisi_ad"] as? String ?? ""
                        let person_phone = d["kisi_tel"] as? String ?? ""
                        
                        if person_name.lowercased().contains(word.lowercased()) {
                            let person = Kisiler(kisi_id: person_id, kisi_ad: person_name, kisi_tel: person_phone)
                            list.append(person)
                        }
                      
                    }
                }
            }
            DispatchQueue.main.async {
                self.personsList=list
            }
            
        })
    }
    
    func remove(person_id:String){
        refPersons.child(person_id).removeValue()
    }
}
