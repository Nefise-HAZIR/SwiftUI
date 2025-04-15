//
//  HomeScreenViewModel.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 28.01.2025.
//

import Foundation
import Alamofire
class HomeScreenViewModel : ObservableObject {
    @Published var personsList=[Kisiler]()
 
    
    func downloadPersons () {
    let url="http://kasimadalan.pe.hu/kisiler/tum_kisiler.php"
        AF.request(url,method: .get).response{ response in
            if let data = response.data {
                do {
                   let result =  try JSONDecoder().decode(PersonsResponse.self, from: data)
                  
                    if let list = result.kisiler{
                        DispatchQueue.main.async {
                            self.personsList = list
                        }
                    }
                  
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
        
       
    }
    
    func search(word:String){
        let url="http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php"
        let params:Parameters = ["kisi_ad":word]
            AF.request(url,method: .post,parameters: params).response{ response in
                if let data = response.data {
                    do {
                       let result =  try JSONDecoder().decode(PersonsResponse.self, from: data)
                      
                        if let list = result.kisiler{
                            DispatchQueue.main.async {
                                self.personsList = list
                            }
                        }
                      
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }
    }
    
    func remove(person_id:Int){
        let url="http://kasimadalan.pe.hu/kisiler/delete_kisiler.php"
        let params:Parameters = ["kisi_id":person_id]
            AF.request(url,method: .post,parameters: params).response{ response in
                if let data = response.data {
                    do {
                       let result =  try JSONDecoder().decode(CRUDCevap.self, from: data)
                        print("\(result.success!) - \(result.message!)")
                        self.downloadPersons()
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}
