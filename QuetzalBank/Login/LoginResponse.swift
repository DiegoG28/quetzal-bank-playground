//
//  Login.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 05/06/23.
//

import Foundation

struct LoginResponse: Codable {
    var status: String
    var message: String
    var token: String
}
