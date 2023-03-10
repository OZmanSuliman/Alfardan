//
//  UserDefaultInfo.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

internal struct UserDefaultInfo<Value> {
   var key: String
   var defaultValue: Value
}

internal extension UserDefaultInfo {

   func get() -> Value {
       guard let valueUntyped = UserDefaults.standard.object(forKey: self.key), let value = valueUntyped as? Value else {
           return self.defaultValue
       }

       return value
   }

   func set(_ value: Value) {
       UserDefaults.standard.set(value, forKey: self.key)
   }

   func getObject<T: Decodable>() -> T? {
       if let data = UserDefaults.standard.data(forKey: self.key) {
           return try? JSONDecoder().decode(T.self, from: data)
       } else {
           return nil
       }
   }

   func setObject<T: Encodable>(encodable: T) {
       if let data = try? JSONEncoder().encode(encodable) {
           UserDefaults.standard.setValue(data, forKey: self.key)
       }
   }

}

enum UserDefaultsEnum {
    private static var userEmailInfo = UserDefaultInfo(key: "userEmail", defaultValue: String())
    static var userEmail: String {
        get { return userEmailInfo.get() }
        set { userEmailInfo.set(newValue) }
    }
}

