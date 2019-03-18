//
//  RequestFactory.swift
//  Viper_TDD
//
//  Created by Madan on 18/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import Foundation
class RequestFactory {
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
}
