//
//  DoubleExtension.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 28/07/24.
//

import Foundation

extension Double {
    func toDollar(digit: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.maximumFractionDigits = digit
        
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
