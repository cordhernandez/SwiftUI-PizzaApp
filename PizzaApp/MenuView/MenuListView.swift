//
//  MenuListView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct MenuListView: View {
    
    @ObservedObject var orderModel: OrderModel
    var menuList = MenuModel().menu
    
    var body: some View {
        VStack {
            ListHeaderView(orderModel: orderModel, text: "Menu")
            NavigationView {
                List(menuList) { item in
                    NavigationLink {
                        MenuDetailView(orderModel: orderModel, menuItem: item)
                    } label: {
                        MenuRowView(menuItem: item)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .navigationTitle("Pizza Order")
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel: OrderModel())
    }
}
