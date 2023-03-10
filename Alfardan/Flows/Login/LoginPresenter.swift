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
    func didHasAttemptedToLogIn()
    var email : String { get set }
    var password: String { get set }
    var emailPrompt: String { get  }
    var passwordPrompt: String { get  }
    var isSignUpComplete: Bool { get }
}

class LoginPresenter: LoginPresenterProtocol {
    
    private let store = AppState.shared
    @Published var email = ""
    @Published var password = ""
    @Published var hasAttemptedToLogIn = false
    func isPasswordValid() -> Bool {
            // criteria in regex.  See http://regexlib.com
            let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                           "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
            return passwordTest.evaluate(with: password)
        }
    
    func isEmailValid() -> Bool {
           // criteria in regex.  See http://regexlib.com
           let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
           return emailTest.evaluate(with: email)
       }
    
    var emailPrompt: String {
          if !hasAttemptedToLogIn || isEmailValid() {
              return ""
          } else {
              return "Enter a valid email address"
          }
      }
      
      var passwordPrompt: String {
          if !hasAttemptedToLogIn || isPasswordValid() {
              return ""
          } else {
              return "Must be between 8 and 15 characters containing at least one number and one capital letter"
          }
      }
    
    var isSignUpComplete: Bool {
            if !isPasswordValid() ||
            !isEmailValid() {
                return false
            }
            return true
        }
        
    func didHasAttemptedToLogIn() {
        hasAttemptedToLogIn = true
    }
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
