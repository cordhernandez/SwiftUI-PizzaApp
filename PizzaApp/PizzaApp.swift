//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/1/22.
//

import SwiftUI

@main
struct PizzaApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(UserPreferences())
        }
    }
}
