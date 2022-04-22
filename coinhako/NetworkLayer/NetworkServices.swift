//
//  NetworkServices.swift
//  coinhako
//
//  Created by Macbook on 20/04/2022.
//

import Foundation

protocol NetworkService {
    func request<TypeRequest: NetworkRequest>(rq: TypeRequest, completion: @escaping(Data?, Error?) -> Void)
}
