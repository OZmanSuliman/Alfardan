//
//  LoginRequest.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

// MARK: - LoginRequestProtocol

protocol LoginRequestProtocol: APIRequestProtocol {}

// MARK: - LoginRequestRequest

struct LoginRequest: LoginRequestProtocol {
    var user: User

    init(user: User) {
        self.user = user
    }
}

extension LoginRequest {
    var endpoint: String { return APIEndpoints.login.fullPath() }
    var method: HTTPMethod { return .post }
    var parameters: [String: Any] { return
        [
            "email": user.email ?? "",
            "password": user.password ?? "",
        ]
    }
}
