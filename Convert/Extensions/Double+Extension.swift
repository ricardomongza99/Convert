//
//  Double+Extension.swift
//  Convert
//
//  Created by Ricardo Montemayor on 21/02/22.
//

import Foundation

extension Double {
    func rounded(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
