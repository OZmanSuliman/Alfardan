//
//  User.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

// MARK: - User

struct User: Codable {
    let password: String?
    let email: String?

    init(password: String, email: String) {
        self.password = password
        self.email = email
    }

}

extension User {
    enum CodingKeys: String, CodingKey {
        case password
        case email
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }
}
