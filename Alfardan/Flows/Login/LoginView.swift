//
//  LoginView.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

// MARK: - LoginView

struct LoginView<interactorProtocol: LoginInteractorProtocol, presenterProtocol: LoginPresenterProtocol>: View {
    @StateObject var store = AppState.shared
    let interactor: interactorProtocol
    let presenter: presenterProtocol
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPresented = true
    
    var body: some View {
        ZStack {
            // Bg
            Image(Strings.bg.fullString())
                .resizable()
                .overlay(
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.65))
                )
                .ignoresSafeArea(.all)
                .onTapGesture {
                    hideKeyboard()
                }
            switch store.stateCalculator {
            case .loading:
                ProgressView()
                    .tint(.white)
            case let .failed(error):
                EmptyView()
                    .alert(error ?? Strings.error.fullString(), isPresented: $isPresented) {
                        Button(Strings.ok.fullString().uppercased(), role: .cancel) {
                        store.stateCalculator = .idle
                    }
                }
            case let .loaded(user):
                EmptyView()
                    .alert(Strings.welcome.fullString(withParameters: "\(user)"), isPresented: $isPresented) {
                    Button(Strings.ok.fullString().uppercased(), role: .cancel) {
                        store.stateCalculator = .idle
                    }
                }
            default:
                EmptyView()
            }
            VStack {
                // Logo
                Image(Strings.logo.fullString())
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(.top, 45)
                Spacer()
                // Form
                VStack(spacing: 15) {
                    VStack(alignment: .center, spacing: 30) {
                        VStack(alignment: .center) {
                            CustomTextfield(placeholder:
                                Text(Strings.email.fullString()),
                                fontName: Strings.openSansRegular.fullString(),
                                fontSize: 18,
                                fontColor: Color.white.opacity(0.3),
                                username: $email)
                            Divider()
                                .background(Color.white)
                        }
                        VStack(alignment: .center) {
                            CustomSecureField(placeholder:
                                Text(Strings.password.fullString()),
                                fontName: Strings.openSansRegular.fullString(),
                                fontSize: 18,
                                fontColor: Color.white.opacity(0.3),
                                password: $password)
                            Divider()
                                .background(Color.white)
                        }
                    }
                    HStack {
                        Button(action: {}) {
                            Text(Strings.requestNewPassword.fullString())
                                .modifier(CustomTextM(fontName: Strings.openSansRegular.fullString(), fontSize: 14, fontColor: Color.white.opacity(0.65)))
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal, 35)

                // Button
                Button(action: {self.interactor.login(email: self.email, password: self.password)}) {
                    Text(Strings.login.fullString().uppercased())
                        .modifier(CustomTextM(fontName: Strings.openSansBold.fullString(), fontSize: 14, fontColor: Color.black))
                        .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white, buttonRadius: 10))
                }
                .disabled(store.stateCalculator == .loading )
                .padding(.horizontal, 35)
                .padding(.top, 30)
                Spacer()
                // SighnUp
                VStack(spacing: 15) {
                    Text(Strings.needAnAccount.fullString())
                        .modifier(CustomTextM(fontName: Strings.openSansBold.fullString(), fontSize: 14, fontColor: Color.white.opacity(0.5)))
                    Button(action: {}) {
                        Text(Strings.signup.fullString().uppercased())
                            .modifier(CustomTextM(fontName: Strings.openSansBold.fullString(), fontSize: 14, fontColor: Color.white))
                            .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white.opacity(0.15), buttonRadius: 10))
                    }
                    .disabled(store.stateCalculator == .loading )
                }
                .padding(.horizontal, 90)
                .padding(.bottom, 30)
            }
        }
        
        .navigationBarHidden(true)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRouter().createModule()
    }
}

