//
//  Looper.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import Foundation


/// Loop check 30s call api to update coin
class PriceRealTime {
    
    private var timer: Timer?
    /// 30 seconds
    private let period: Int = 30
    
    func start(action: @escaping() -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { itimer in
            if let last = SettingStorage.lastUpdate {
                let dis = DateHelper.distanceSeconds(fromDate: last, toDate: .now)
                if dis >= self.period {
                    SettingStorage.lastUpdate = Date()
                    action()
                }
            } else {
                SettingStorage.lastUpdate = Date()
                action()
            }
        })
    }
}
