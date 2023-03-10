//
//  SplashRouter.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

protocol SplashRouterProtocol {
    associatedtype I: SplashInteractorProtocol
    associatedtype P: SplashPresenterProtocol
    func createModule() -> SplashView<I, P>
}

// MARK: - LessonsListRouter

class SplashRouter: SplashRouterProtocol {
    func createModule() -> SplashView<SplashInteractor<SplashPresenter>, SplashPresenter> {
        let apiManager = ApiManager.shared
        let presenter = SplashPresenter()
        let interactor = SplashInteractor(apiManager: apiManager, presenter: presenter)
        return SplashView(interactor: interactor, presenter: presenter)
    }
}
