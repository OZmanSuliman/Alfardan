//
//  AlfardanApp.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

let realmDatabaseVersion = 1

// MARK: - AlfardanApp

@main
struct AlfardanApp: App {
    let splash = SplashRouter().createModule()
    init() {
        DatabaseService.configureDataMigration()
    }

    var body: some Scene {
        WindowGroup {
            splash
        }
    }
}
