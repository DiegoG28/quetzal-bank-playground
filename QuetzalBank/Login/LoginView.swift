//
//  LoginView.swift
//  QuetzalBank
//
//  Created by IMAC 20 on 25/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var nombre :
    String = ""
    
    var body: some View {
        VStack{
            Image(systemName: "person")
                .resizable(capInsets:(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)))
                .frame(width: 100,height: 100)
            
            Text("QuetzalBank").padding(50)
            
            GroupBox(label: Text("Number:")) {
                TextField("Number", text: $nombre)
            }
            GroupBox(label: Text("Password:")) {
                TextField("Password", text: $nombre)
            }
            Button("Ingresar"){
                print("Ingresar")
            }
            .frame(width: 500)
                .foregroundColor(Color.black)
                .background(Color.gray)
            
            
            
        }
            
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
