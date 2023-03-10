//
//  MockPresenter.swift
//  Alfardan
//
//  Created by Osman Ahmed on 10/03/2023.
//

import Foundation

  class MockPresenter: SplashPresenterProtocol {
      var didGetInfoCalled = false
      var didGetInfoEmail: String?
      var shouldNavigate: Bool = false
      
      func didGetInfo(email: String) {
          didGetInfoCalled = true
          didGetInfoEmail = email
      }
  }
