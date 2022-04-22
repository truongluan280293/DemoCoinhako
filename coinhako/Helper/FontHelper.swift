//
//  FontHelper.swift
//  coinhako
//
//  Created by Macbook on 22/04/2022.
//

import Foundation
import UIKit

enum FontName: String {
    case bold = "HelveticaNeue-Bold"
    case regular = "HelveticaNeue"
}

struct FontHelper {
    
    static func font(name: FontName, size: CGFloat) -> UIFont {
        let font = UIFont.init(name: name.rawValue, size: size)
        if let ifont = font {
            return ifont
        }
        return UIFont.systemFont(ofSize: size)
    }
}

