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
        VStack {
            HStack {
                Image(systemName: "\(orderItem.id).square")
                Text(orderItem.description)
                    .font(.headline)
                Spacer()
                Text(orderItem.formattedExtendedPrice)
                    .bold()
            }
            Text(orderItem.comments)
        }
        .animation(.none)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(orderItem: testOrderItem)
            .environment(\.dynamicTypeSize, .accessibility5)
    }
}
