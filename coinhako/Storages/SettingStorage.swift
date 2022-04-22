//
//  SettingStorage.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import Foundation

@propertyWrapper struct SettingStored<Value> {
    let key: String
    let userDefault = UserDefaults.standard
    
    var wrappedValue: Value? {
        get {userDefault.value(forKey:key) as? Value}
        set {userDefault.setValue(newValue, forKey: key)}
    }
    
}

struct SettingKeys {
    
    /// Last time to update the coin price
    static let lastUpdate = "last.update.coin"
}


struct SettingStorage {
    
    @SettingStored<Date>(key: SettingKeys.lastUpdate)
    static var lastUpdate
}
