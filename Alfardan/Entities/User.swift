//
//  User.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

// MARK: - User

struct User: Codable {
    let id: Int?
    let createdAt: Date?
    let name: String?
    let address: String?
    let password: String?
    let email: String?
    let token: String?

    init(id: Int, name: String, createdAt: Date, address: String, password: String, email: String, token: String) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.address = address
        self.password = password
        self.email = email
        self.token = token
    }
    
    init (from model: UserDB) {
        self.id = model.id
        name = model.name
        createdAt = model.createdAt
        address = model.address
        email = model.email
        token = model.token
        self.password = nil
    }
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case name
        case address
        case password
        case email
        case token
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        createdAt = try values.decodeIfPresent(Date.self, forKey: .createdAt)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
}
