//
//  UserDB.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation
import RealmSwift


class UserDB: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String?
    @Persisted var createdAt: Date?
    @Persisted var address: String?
    @Persisted var email: String?
    @Persisted var token: String?

    func mapping(model: User) -> UserDB {
    
        self.id = model.id ?? 0
        name = model.name
        createdAt = model.createdAt
        address = model.address
        email = model.email
        token = model.token
        
        return self
    }
}
