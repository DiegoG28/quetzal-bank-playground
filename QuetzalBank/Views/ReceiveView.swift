//
//  PantallaRecibir.swift
//  QuetzalBank
//
//  Created by imac 07 on 25/05/23.
//

import SwiftUI

struct ReceiveView: View {
    @Binding var isUserLoggedIn: Bool
    @Binding var defaults: UserDefaults
    @Binding var username: String
    @StateObject var uvm: UserViewModel = UserViewModel()
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.white
                VStack(alignment: .leading, spacing: 10){
                Text("Recibir").padding()
                Text("Estos son los datos que debes compartir para recibir dinero a esta cuenta").padding()
                Text("Beneficiario:").padding()
                    Button(action: {
                        
                    }) {
                        
                        Text(defaults.string(forKey: "username") ?? username)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)                        }
                            
                    
                    Text("CLABE:").padding()
                    Button(action: {
                        
                    }) {
                        Text("1234567890123456678")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    Button("Salir") {
                        isUserLoggedIn = false
                    }
            }
                .padding()
        }
    }
}

