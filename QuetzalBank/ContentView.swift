//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserLoggedIn: Bool = false
    @State private var defaults: UserDefaults = UserDefaults()
    @State private var username: String = ""
    var body: some View {
        VStack {
            if (isUserLoggedIn) {
                ReceiveView(isUserLoggedIn: $isUserLoggedIn, defaults: $defaults, username: $username)
            } else {
                LoginView(isUserLoggedIn: $isUserLoggedIn, defaults: $defaults, username: $username)
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
