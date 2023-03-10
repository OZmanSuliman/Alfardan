//
//  AlfardanApp.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

let realmDatabaseVersion = 3

// MARK: - AlfardanApp

@main
struct AlfardanApp: App {
    let splash = SplashRouter().createModule()
    init() {
        DatabaseService.configureDataMigration()
        print("\(EnvironmentManager.shared.getBaseUrl())")
    }

    var body: some Scene {
        WindowGroup {
            splash
        }
    }
}
