//
//  RootTabBar.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/20/22.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            ContentView(orderModel: OrderModel())
                .tabItem {
                    Image(systemName: "cart")
                    Text("order")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "book")
                    Text("History")
                }
        }
        .accentColor(Color("B1"))
    }
}

struct RootTabBar_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView().environmentObject(UserPreferences())
    }
}
