//
//  OrderListView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct OrderListView: View {
    
    @ObservedObject var orderModel: OrderModel
    
    var body: some View {
        VStack {
            ListHeaderView(orderModel: orderModel, text: "Your Order")
            List(orderModel.orders) { item in
                OrderRowView(orderItem: item)
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}
