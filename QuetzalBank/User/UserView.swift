//
//  UserView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 29/05/23.
//

import SwiftUI

struct UserView: View {
    @StateObject var uvm: UserViewModel = UserViewModel()
    @State var shouldUpdateUser: Bool = false
    @State var userToUpdate: UserEntity?
    
    var body: some View {
        VStack {
            Text("Users")
            HStack {
                TextField("Username", text: $uvm.c_username)
                TextField("Password", text: $uvm.c_password)
                if (shouldUpdateUser) {
                    Button("Edit") {
                        uvm.updateUser(user: userToUpdate!)
                        uvm.clearState()
                        shouldUpdateUser = false
                    }
                } else {
                    Button("Save") {
                        uvm.createUser()
                    }.buttonStyle(.bordered)
                }
            }
            if (uvm.users.count == 0) {
                Text("No hay datos")
            } else {
                List (uvm.users) { user in
                    VStack {
                        HStack {
                            Text(user.username ?? "")
                            Text(user.password ?? "")
                        }
                        
                        HStack {
                            Button("Delete") {
                                uvm.deleteUser(user: user)
                            }.buttonStyle(.bordered)
                            Button("Edit"){
                                shouldUpdateUser = true
                                userToUpdate = user
                                uvm.c_username = user.username ?? ""
                                uvm.c_password = user.password ?? ""
                            }.buttonStyle(.bordered)
                        }
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
