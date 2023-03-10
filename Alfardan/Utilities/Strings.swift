//
//  Strings.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

enum Strings: String {
    
    case EnvironmentVariables
    case Configuration
    case plist
    case noSetting = "No <%@> setting has been found"
    case environmentVariablesPlist = "EnvironmentVariables.plist"
    case unableToLoadPLIST = "Unable to load PLIST at path: %@"
    case PropertyNotOfType = "Property %@ is not of type %@"
    case networkSerialQueue
    case appStateSerialQueue
    case bg = "background"
    case logo
    case email = "Email"
    case password = "Password"
    case openSansRegular = "OpenSans-Regular"
    case requestNewPassword = "Request new password"
    case login
    case openSansBold = "OpenSans-Bold"
    case needAnAccount = "Need an account?"
    case signup = "sign up"
    case error = "There is an error"
    case ok
    case welcome = "welcome %@"
    
    
    func fullString(withParameters parameters: CVarArg...) -> String {
        var str = self.rawValue

        if parameters.count > 0 {
            str = String(format: str, arguments: parameters)
        }

        return str
    }
}

