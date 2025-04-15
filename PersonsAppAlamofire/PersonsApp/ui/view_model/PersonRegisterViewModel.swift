//
//  PersonRegisterViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import Alamofire

class PersonRegisterViewModel {
   
    
    func save(person_name:String,person_phone:String){
        let url="http://kasimadalan.pe.hu/kisiler/insert_kisiler.php"
        let params:Parameters = ["kisi_ad":person_name , "kisi_tel": person_phone]
            AF.request(url,method: .post,parameters: params).response{ response in
                if let data = response.data {
                    do {
                       let result =  try JSONDecoder().decode(CRUDCevap.self, from: data)
                        print("\(result.success!) - \(result.message!)")
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}
