//
//  LoginPresenter.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation
import Combine

protocol LoginPresenterProtocol: ObservableObject {
    func startLoading()
    func didLoggedIn(user: User?)
    func didLoggedInWithError(error: String?)
}

class LoginPresenter: LoginPresenterProtocol  {
    private let store = AppState.shared
    
    func startLoading() {
        store.stateCalculator = .loading
    }
    
    func didLoggedIn(user: User?) {
        store.stateCalculator = .loaded(user as Any)
    }
    
    func didLoggedInWithError(error: String?) {
        store.stateCalculator = .failed(error ?? Strings.error.fullString())
    }
}
