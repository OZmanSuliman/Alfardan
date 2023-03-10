//
//  SplashInteractorTests.swift
//  AlfardanTests
//
//  Created by Osman Ahmed on 10/03/2023.
//

@testable import Alfardan_Dev
import XCTest

class SplashInteractorTests: XCTestCase {
    func testGetInfoCallsPresenter() {
        // Given
        let mockApiManager = MockApiManager()
        let mockPresenter = MockPresenter()
        let sut = SplashInteractor(apiManager: mockApiManager, presenter: mockPresenter)

        // When
        sut.getInfo()

        // Then
        XCTAssertTrue(mockPresenter.didGetInfoCalled)
        XCTAssertEqual(mockPresenter.didGetInfoEmail, UserDefaultsEnum.userEmail)
    }
}
