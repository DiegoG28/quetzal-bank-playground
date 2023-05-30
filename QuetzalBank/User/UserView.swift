//
//  UserView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 29/05/23.
//

import SwiftUI

struct UserView: View {
    @StateObject var uvm: UserViewModel = UserViewModel()
    var body: some View {
        VStack {
            Text("Users")
            HStack {
                TextField("Username", text: $uvm.c_username)
                TextField("Password", text: $uvm.c_password)
                Button("Save") {
                    uvm.createUser()
                }
            }
            if (uvm.users.count == 0) {
                Text("No hay datos")
            } else {
                List (uvm.users) { user in
                    HStack {
                        Text(user.username ?? "")
                        Text(user.password ?? "")
                    }
                    Button("Delete") {
                        uvm.deleteUser(user: user)
                    }
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
