//
//  Parser.swift
//  coinhako
//
//  Created by Macbook on 20/04/2022.
//

import Foundation

class Parser {
    static func json<T: Decodable>(fromData data: Data, toType type: T.Type) throws -> T {
        let dc = JSONDecoder()
        do {
            let obj = try dc.decode(T.self, from: data)
            return obj
        } catch {
            throw error
        }
    }
    
    static func dictionary<T: Encodable>(fromObj obj: T) throws -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(obj)
            let dic = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
            return dic
        } catch {
            throw error
        }
    }
}
