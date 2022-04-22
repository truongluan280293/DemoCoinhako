//
//  ListCoinRequest.swift
//  coinhako
//
//  Created by Macbook on 19/04/2022.
//

import Foundation
import Alamofire

struct ListCoinRequest: NetworkRequest {
    var method: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "/price/all_prices_for_mobile"
    }
    
    var headers: HTTPHeaders {
        return HTTPHeaders([:])
    }
    
    var url: URL {
        let full = NetworkConfig.baseDomain + self.endpoint
        return URL(string: full)!
    }
    
    var parameters: GetCoinParameter?
    
    init(bodyRequest: GetCoinParameter) {
        self.parameters = bodyRequest
    }

}

struct GetCoinParameter: Encodable {
    var counterCurrency: String
    
    enum CodingKeys: String, CodingKey {
        case counterCurrency = "counter_currency"
    }
}




