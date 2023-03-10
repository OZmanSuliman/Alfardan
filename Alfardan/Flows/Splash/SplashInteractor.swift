//
//  SplashInteractor.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation
import SwiftUI

// MARK: - SplashInteractorProtocol

protocol SplashInteractorProtocol: ObservableObject {
    func getInfo()
}

// MARK: - SplashInteractor

class SplashInteractor<Presenter: SplashPresenterProtocol>: SplashInteractorProtocol {
    private let apiManager: ApiManagerProtocol
    private var presenter: Presenter

    init(apiManager: ApiManagerProtocol, presenter: Presenter) {
        self.apiManager = apiManager
        self.presenter = presenter
    }
}

extension SplashInteractor {
    func getInfo() {
            let userEmail = UserDefaultsEnum.userEmail
            presenter.didGetInfo(email: userEmail)
        }
}
