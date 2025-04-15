//
//  PersonRow.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI

struct PersonRow: View {
    var person=Kisiler()
    var body: some View {
        VStack(alignment:.leading,spacing: 16){
            Text(person.kisi_ad!).font(.system(size: 25))
            Text(person.kisi_tel!).font(.system(size: 20)).font(.system(size: 20)).foregroundColor(.gray)
        }
    }
}

#Preview {
    PersonRow()
}
