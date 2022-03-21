//
//  ContentView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/1/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderModel: OrderModel
    @State var isMenuDisplayed = true
    
    var body: some View {
        VStack {
//            ContentHeaderView()
//                .layoutPriority(2)
            Button {
                isMenuDisplayed.toggle()
            } label: {
                PageTitleView(title: "Order Pizza", isDisplayingOrders: isMenuDisplayed)
            }
            MenuListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
//            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
            ContentView(orderModel: OrderModel())
                .environmentObject(UserPreferences())
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
