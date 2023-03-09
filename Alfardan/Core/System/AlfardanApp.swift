//
//  AlfardanApp.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

let realmDatabaseVersion = 3

@main
struct AlfardanApp: App {
    init() {
        DatabaseService.configureDataMigration()
        print("\(EnvironmentManager.shared.getBaseUrl())")
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
