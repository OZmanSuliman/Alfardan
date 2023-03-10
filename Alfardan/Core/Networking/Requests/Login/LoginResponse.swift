//
//  LoginResponse.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation


protocol LoginResponseProtocol: APIResponseProtocol {
    var user: User? { get }
}

public class LoginResponse: LoginResponseProtocol {
    var user: User?

    public required init(with json: Data) {
        do {
            let _ = try JSONDecoder().decode(User.self, from: json)
        } catch {
            print(error)
        }
    }
}
