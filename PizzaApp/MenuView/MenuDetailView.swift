//
//  MenuDetailView.swift
//  Pizza
//
//  Created by Steven Lipton on 9/2/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`
struct MenuDetailView: View {
    let sizes: [Size] = [.small, .medium, .large]
    @EnvironmentObject var settings: UserPreferences
    @ObservedObject var orderModel: OrderModel
    @State var didOrder: Bool = false
    @State var quantity: Int = 1
    
    var menuItem:MenuItem
    
    var formattedPrice: String {
        String(format:"%3.2f", menuItem.price * Double(quantity) * settings.size.rawValue)
    }
    
    func addItem() {
        //        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    
    var body: some View {
        VStack {
            PageTitleView(title: menuItem.name)
            SelectedImageView(imageName: "\(menuItem.id)_250w")
                .padding(5)
                .layoutPriority(3)
            
            Text(menuItem.description)
                .lineLimit(5)
                .padding()
                .layoutPriority(3)
            
            Spacer()
            SizePickerView(size: $settings.size)
            QuantityStepperView(quantity: $quantity)
            HStack{
                Text("Order:  \(formattedPrice)")
                    .font(.headline)
                Spacer()
                Text("Order total: " + orderModel.formattedTotal )
                    .font(.headline)
            }
            .padding()
            HStack{
                Spacer()
                Button(action: addItem) {
                    Text("Add to order")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color("G4"))
                        .foregroundColor(Color("IP"))
                        .cornerRadius(5)
                }
                .sheet(isPresented: $didOrder) {
                    ConfirmView(orderModel: orderModel,
                                isPresented: $didOrder,
                                quantity: $quantity,
                                size: $settings.size,
                                menuID: menuItem.id)
                }
                
                Spacer()
            }
            .padding(.top)
            Spacer()
        }
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel: OrderModel(), menuItem: testMenuItem)
    }
}
