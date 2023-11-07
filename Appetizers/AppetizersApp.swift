//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            MainTabBarView().environmentObject(order)
        }
    }
}
