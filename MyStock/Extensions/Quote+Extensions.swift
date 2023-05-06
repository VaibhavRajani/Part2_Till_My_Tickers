//
//  Quote+Extensions.swift
//  MyStock
//
//  Created by Vaibhav on 05/05/23.
//

import Foundation
import XCAStocksAPI

extension Quote {
    
    var regularPriceText: String? {
        Utils.format(value: regularMarketPrice)
    }
    
    var regularDiffText: String? {
        guard let text = Utils.format(value: regularMarketChange) else { return nil }
        return text.hasPrefix("-") ? text : "+\(text)"
    }
    
}
