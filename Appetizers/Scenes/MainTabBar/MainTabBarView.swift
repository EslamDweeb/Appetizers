//
//  MainTabBarView.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
                
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.count)
        }
        .tint(.brandPrimary)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView().environmentObject(Order())
    }
}
