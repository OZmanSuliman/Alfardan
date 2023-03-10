//
//  SplashPresenter.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import Combine
import Foundation

// MARK: - SplashPresenterProtocol

protocol SplashPresenterProtocol: ObservableObject {
    func didGetInfo(email: String)
    var shouldNavigate: Bool { get set }
}

// MARK: - SplashPresenter

class SplashPresenter: SplashPresenterProtocol {
    @Published var shouldNavigate: Bool = false

    func didGetInfo(email _: String) {
        shouldNavigate = true
    }
}
