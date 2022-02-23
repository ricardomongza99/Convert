//
//  Units.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

enum UnitType: String {
    case length = "📏"
    case volume = "💧"
    case area = "🖼"
    case temperature = "🌡"
    case currency = "💵"
    case mass = "⚖️"
    case storage = "💾"
    case time = "⏱"
}

struct Unit: Hashable {
    var name: String
    var symbol: String
    var unit: Dimension
}


