//
//  NetworkRequest.swift
//  coinhako
//
//  Created by Macbook on 19/04/2022.
//

import Foundation
import Alamofire

protocol NetworkRequest {
    associatedtype Body: Encodable

    var method: HTTPMethod {get}
    var endpoint: String {get}
    var headers: HTTPHeaders {get}
    
    var url: URL {get}
    var parameters: Body? {get}
    
}
