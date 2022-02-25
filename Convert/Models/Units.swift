//
//  Units.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

enum UnitType: String {
    case length = "📏 Length"
    case volume = "💧 Volume"
    case area = "🖼 Area"
    case temperature = "🌡 Temp."
    case currency = "💵 Currency"
    case mass = "⚖️ Mass"
    case storage = "💾 Storage"
    case time = "⏱ Time"
}

struct Unit: Hashable {
    var name: String
    var unit: Dimension
}


