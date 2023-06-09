//
//  Movement.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 01/06/23.
//

import Foundation

struct Movement: Codable, Identifiable {
    var id: Int
    var ori_account: String
    var amount: String
    var des_account: String
    var description: String
}
