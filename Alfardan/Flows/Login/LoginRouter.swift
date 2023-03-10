//
//  LoginRouter.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Foundation

// MARK: - LessonsListRouterProtocol

protocol LoginRouterProtocol {
    associatedtype I: LoginInteractorProtocol
    associatedtype P: LoginPresenterProtocol
    func createModule() -> LoginView<I, P>
}

// MARK: - LessonsListRouter

class LoginRouter: LoginRouterProtocol {
    func createModule() -> LoginView<LoginInteractor<LoginPresenter>, LoginPresenter> {
        let apiManager = ApiManager.shared
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(apiManager: apiManager, presenter: presenter)
        return LoginView(interactor: interactor, presenter: presenter)
    }
}
