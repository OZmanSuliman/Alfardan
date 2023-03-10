//
//  MockApiManager.swift
//  Alfardan
//
//  Created by Osman Ahmed on 10/03/2023.
//

import Foundation

class MockApiManager: ApiManagerProtocol {
    var apiRequestCalled = false
    var passedRequest: APIRequestProtocol?
    var response: APIResponseProtocol?
    var error: Error?
    var statusCode: Int?
    
    func apiRequest<Response>(_ request: APIRequestProtocol, withSuccess success: @escaping apiSuccess<Response>, WithApiFailure failure: @escaping apiFailure) where Response: APIResponseProtocol {
        apiRequestCalled = true
        passedRequest = request
        if let error = error {
            failure(error)
        } else {
            success(response as? Response, nil, statusCode)
        }
    }
}
