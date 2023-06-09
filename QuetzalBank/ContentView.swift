//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Dasboard")
            Button("Movimientos"){
                print("Ingresar")
            }.buttonStyle(.bordered)
            Button("Perfil"){
                print("Ingresar")
            }.buttonStyle(.bordered)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
