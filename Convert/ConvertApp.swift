//
//  ConvertApp.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI
//test
@main
struct ConvertApp: App {
    var body: some Scene {
        WindowGroup {
            ConvertView()
                .environmentObject(ConvertViewModel())
        }
    }
}
