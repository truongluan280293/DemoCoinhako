//
//  MockupServiceAPI.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import Foundation
class MockupServiceAPI: NetworkService {
    func request<TypeRequest>(rq: TypeRequest, completion: @escaping (Data?, Error?) -> Void) where TypeRequest : NetworkRequest {
        guard let path = Bundle.main.path(forResource: "coins-test", ofType: "json") else {
            completion(nil, nil)
            return
        }
        guard let idata = try? Data(contentsOf: .init(fileURLWithPath: path)) else {
            completion(nil, nil)
            return
        }
        completion(idata, nil)
    }
}
