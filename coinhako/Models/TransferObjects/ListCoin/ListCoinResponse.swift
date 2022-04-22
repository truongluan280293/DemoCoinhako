//
//  ListCoinResponse.swift
//  coinhako
//
//  Created by Macbook on 19/04/2022.
//

import Foundation

struct ListCoinResponse: Decodable, NetworkResponse {
    var data: [DataCoin]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct DataCoin: Decodable {
    
    var base: String
    var counter: String
    var buyPrice: Double
    var sellPrice: Double
    var icon: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case base, counter, icon, name
        case buyPrice = "buy_price"
        case sellPrice = "sell_price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.base = try container.decode(String.self, forKey: .base)
        self.counter = try container.decode(String.self, forKey: .counter)
        let buy = try container.decode(String.self, forKey: .buyPrice)
        let sell = try container.decode(String.self, forKey: .sellPrice)
        self.buyPrice = Double(buy) ?? 0
        self.sellPrice = Double(sell) ?? 0
        
    }
}
