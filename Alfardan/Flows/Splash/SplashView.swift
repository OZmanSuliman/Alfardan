//
//  SplashView.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

// MARK: - SplashView

struct SplashView<interactorProtocol: SplashInteractorProtocol, presenterProtocol: SplashPresenterProtocol>: View where presenterProtocol: ObservableObject {
    @StateObject var store = AppState.shared
    let interactor: interactorProtocol
    @ObservedObject var presenter: presenterProtocol
    init(interactor: interactorProtocol, presenter: presenterProtocol) {
        self.interactor = interactor
        self.presenter = presenter
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Bg
                Image(Strings.bg.fullString())
                    .resizable()
                    .overlay(
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.1))
                    )
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    // Logo
                    Image(Strings.logo.fullString())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                }
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .onAppear {
                interactor.getInfo()
            }
            .navigationBarHidden(true)
            .navigationDestination(
                 isPresented: $presenter.shouldNavigate) {
                     LoginRouter().createModule()
                 }
        }
    }
}

// MARK: - SplashView_Previews

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashRouter().createModule()
    }
}
