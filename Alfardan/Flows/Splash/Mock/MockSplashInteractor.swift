//
//  MockSplashInteractor.swift
//  Alfardan
//
//  Created by Osman Ahmed on 10/03/2023.
//

import Foundation

// Mock the SplashInteractor
class MockSplashInteractor<Presenter: SplashPresenterProtocol>: SplashInteractorProtocol {
    private var presenter: Presenter
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    func getInfo() {
        presenter.didGetInfo(email: "")
    }
}
