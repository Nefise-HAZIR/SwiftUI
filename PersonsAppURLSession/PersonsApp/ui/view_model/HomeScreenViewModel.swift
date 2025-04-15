//
//  HomeScreenViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
class HomeScreenViewModel : ObservableObject {
     @Published var personsList=[Kisiler]()
 
    
    func downloadPersons () {
       let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let result = try JSONDecoder().decode(PersonsResponse.self, from: data!)
                if let list = result.kisiler{
                    DispatchQueue.main.async {
                        self.personsList = list
                    }
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
       
    }
    
    func search(word:String){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        let postString = "kisi_ad=\(word)"
        request.httpBody = postString.data(using: .utf8)
        
         URLSession.shared.dataTask(with: request){ data,response,error in
             do{
                 let result = try JSONDecoder().decode(PersonsResponse.self, from: data!)
                 if let list = result.kisiler{
                     DispatchQueue.main.async {
                         self.personsList = list
                     }
                 }
                 
             }catch{
                 print(error.localizedDescription)
             }
         }.resume()
    }
    
    func remove(person_id:Int){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        let postString = "kisi_id=\(person_id)"
        request.httpBody = postString.data(using: .utf8)
        
         URLSession.shared.dataTask(with: request){ data,response,error in
             do{
                 let result = try JSONDecoder().decode(CRUDResponse.self, from: data!)
                 print("delete")
                 print("RESULT : \(result.success!)")
                 print("Message : \(result.message!)")
                 self.downloadPersons()
                 
             }catch{
                 print(error.localizedDescription)
             }
         }.resume()
    }
}
