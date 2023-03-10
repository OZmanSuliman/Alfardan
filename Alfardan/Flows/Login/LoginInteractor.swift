//
//  LoginInteractor.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation
import SwiftUI

// MARK: - LoginInteractorProtocol

protocol LoginInteractorProtocol: ObservableObject {
    func login(email: String, password: String)
}

// MARK: - LoginInteractor

class LoginInteractor<Presenter: LoginPresenterProtocol>: LoginInteractorProtocol {
    private let apiManager: ApiManagerProtocol
    private var presenter: Presenter
    @StateObject var store = AppState.shared
    
    init(apiManager: ApiManagerProtocol, presenter: Presenter) {
        self.apiManager = apiManager
        self.presenter = presenter
    }
}

extension LoginInteractor {
    func login(email: String, password: String) {
        presenter.didHasAttemptedToLogIn()
        if presenter.isSignUpComplete && store.stateCalculator != .loading {
            presenter.startLoading()
            let user = User(password: password, email: email)
            let request = LoginRequest(user: user)
            apiManager.apiRequest(request) { [weak self] (response: LoginResponse?, error, statusCode) in
                print(statusCode ?? 0)
                if let email = user.email, statusCode == 200 {
                    UserDefaultsEnum.userEmail = email
                    self?.presenter.didLoggedIn(user: user)
                } else {
                    self?.presenter.didLoggedInWithError(error: error)
                }
            } WithApiFailure: { [weak self] error in
                self?.presenter.didLoggedInWithError(error: error.localizedDescription)
                print(error)
            }
        }
    }
    
}
