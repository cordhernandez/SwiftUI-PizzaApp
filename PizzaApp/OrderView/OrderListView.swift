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
            List {
                Section(header: ListHeaderView(orderModel: orderModel, text: "Your Order")) {
                    ForEach(orderModel.orders) { item in
                        OrderRowView(orderItem: item)
                    }
                    .onDelete { offSet in
                        orderModel.orders.remove(atOffsets: offSet)
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}
