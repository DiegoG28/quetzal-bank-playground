//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserLoggedIn: Bool = false
    @State private var username: String = ""
    var body: some View {
        VStack {
            if (isUserLoggedIn) {
                ReceiveView(isUserLoggedIn: $isUserLoggedIn, username: $username)
            } else {
                LoginView(isUserLoggedIn: $isUserLoggedIn, username: $username)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
