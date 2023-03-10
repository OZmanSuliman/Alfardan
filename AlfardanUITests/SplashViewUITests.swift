//
//  SplashViewUITests.swift
//  AlfardanUITests
//
//  Created by Osman Ahmed on 10/03/2023.
//

import XCTest
@testable import Alfardan_Dev
import SwiftUI

class SplashViewUITests: XCTestCase {
    var app: XCUIApplication!
    let presenter = SplashPresenter()
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication(bundleIdentifier: "com.oz.Alfardan")
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    func testSplashViewShouldNavigateToLoginView() throws {
        let interactor = MockSplashInteractor(presenter: presenter)
        
        let sut = SplashView(interactor: interactor, presenter: presenter)
        
        // Inject the SplashView to the root view of the current app
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            let rootView = UIHostingController(rootView: sut)
            window.rootViewController = rootView
            window.makeKeyAndVisible()
        }
        
        interactor.getInfo()
        // Verify that the navigation has happened
        
        // Wait for splash screen to disappear
           let exists = NSPredicate(format: "exists == 0")
           expectation(for: exists, evaluatedWith: app.otherElements["SplashView"], handler: nil)
           waitForExpectations(timeout: 5, handler: nil)
           
           // Verify that we have navigated to the LoginView
           let loginView = app.textFields["emailTextField"]
           XCTAssertTrue(loginView.exists, "Expect navigation to LoginView")
        XCTAssertTrue(presenter.shouldNavigate)
    }
}

