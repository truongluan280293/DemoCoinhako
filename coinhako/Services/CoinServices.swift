//
//  CoinServices.swift
//  coinhako
//
//  Created by Macbook on 20/04/2022.
//

import Foundation

class CoinServices {
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func getCoins(counterCurrency currency: String, completion: @escaping(ListCoinResponse?, Error?, Bool) -> Void) {
        let bodyParams = GetCoinParameter.init(counterCurrency: currency)
        let rq = ListCoinRequest(bodyRequest: bodyParams)
        self.service.request(rq: rq) { data, error in
            if let error = error {
                completion(nil, error, false)
                return
            }
            guard let data = data else {
                completion(nil, nil, false)
                return
            }
            do {
                let obj = try ListCoinResponse.parseJson(fromData: data, toType: ListCoinResponse.self)
                completion(obj, nil, true)
            } catch {
                completion(nil, nil, false)
            }
        }
    }
    

}
