//
//  DotApp.swift
//  Dot
//
//  Created by Toope Oladunjoye on 6/3/26.
//

import SwiftUI

@main
struct DotApp: App {
    var body: some Scene {
        MenuBarExtra("Dot", systemImage: "text.pad.header") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
