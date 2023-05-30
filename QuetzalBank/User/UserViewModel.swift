//
//  UserViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 29/05/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserEntity] = []
    
    let dataService = UserController.shared
    
    // Variables para update
    @Published var c_username: String = ""
    @Published var c_password: String = ""
    
    init() {
        getAllUsers()
    }
    
    func getAllUsers() {
        users = dataService.read()
    }
    
    func createUser() {
        dataService.create(username: c_username, password: c_password)
        getAllUsers()
    }
    
    func updateUser(user: UserEntity) {
        dataService.update(entity: user)
        getAllUsers()
    }
    
    func deleteUser(user: UserEntity) {
        dataService.delete(entity: user)
        getAllUsers()
    }
}
