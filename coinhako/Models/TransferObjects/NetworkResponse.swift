//
//  NetworkResponse.swift
//  coinhako
//
//  Created by Macbook on 20/04/2022.
//

import Foundation
protocol NetworkResponse {
    static func parseJson<T: Decodable>(fromData data: Data, toType type: T.Type) throws -> T
}

extension NetworkResponse {
    static func parseJson<T: Decodable>(fromData data: Data, toType type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        do {
            let obj = try decoder.decode(T.self, from: data)
            return obj
        } catch(let error) {
            throw error
        }
    }
}
