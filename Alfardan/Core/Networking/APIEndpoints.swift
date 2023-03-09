//
//  APIEndpoints.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

enum APIEndpoints: String {

case login = "/login"
    
    /** Contains the full path to the endpoint */
    func fullPath(withParameters parameters: CVarArg...) -> String {
        var endpoint = self.rawValue

        if parameters.count > 0 {
            endpoint = String(format: endpoint, arguments: parameters)
        }

        return "\(EnvironmentManager.shared.getBaseUrl())\(endpoint)"
    }
}
