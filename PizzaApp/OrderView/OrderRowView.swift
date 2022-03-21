//
//  OrderRowView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct OrderRowView: View {
    
    var orderItem: OrderItem
    
    var body: some View {
        HStack {
            Text(orderItem.description)
                .font(.headline)
            Spacer()
            Text(orderItem.formattedExtendedPrice)
                .bold()
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(orderItem: testOrderItem)
            .environment(\.dynamicTypeSize, .accessibility5)
    }
}
