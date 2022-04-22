//
//  DateHelper.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import Foundation

class DateHelper {
    class func distanceSeconds(fromDate dateA: Date, toDate dateB: Date) -> Int {
        let cal = Calendar.current
        let diff = cal.dateComponents([.second], from: dateA, to: dateB)
        return diff.second ?? -1
    }
}
