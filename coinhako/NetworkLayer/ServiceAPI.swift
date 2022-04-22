//
//  ServiceAPI.swift
//  coinhako
//
//  Created by Macbook on 20/04/2022.
//

import Foundation
import Alamofire



class ServiceAPI: NetworkService {
    
    func request<TypeRequest: NetworkRequest>(rq: TypeRequest, completion: @escaping(Data?, Error?) -> Void) {
        
        let dataRQ = AF.request(rq.url,
                                method: rq.method,
                                parameters: rq.parameters,
                                headers: rq.headers)
        dataRQ.responseData { response in
            switch response.result {
            case .success(let data):
                completion(data, response.error)
                break
            case .failure(let error):
                completion(nil, error)
                break
            }
        }
    }
    
}
