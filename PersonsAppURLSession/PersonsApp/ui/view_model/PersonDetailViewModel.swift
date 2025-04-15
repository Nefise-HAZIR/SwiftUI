//
//  PersonDetailViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
class PersonDetailViewModel {
   
    func update(person_id:Int,person_name:String,person_phone:String){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        let postString = "kisi_id=\(person_id)&kisi_ad=\(person_name)&kisi_tel=\(person_phone)"
        request.httpBody = postString.data(using: .utf8)
        
         URLSession.shared.dataTask(with: request){ data,response,error in
             do{
                 let result = try JSONDecoder().decode(CRUDResponse.self, from: data!)
                 print("update")
                 print("RESULT : \(result.success!)")
                 print("Message : \(result.message!)")
                 
             }catch{
                 print(error.localizedDescription)
             }
         }.resume()
    }
}
