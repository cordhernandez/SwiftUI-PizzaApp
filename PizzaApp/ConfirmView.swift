//
//  ConfirmView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/13/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct ConfirmView: View {
    
    @ObservedObject var orderModel: OrderModel
    @Binding var isPresented: Bool
    @Binding var quantity: Int
    @Binding var size: Size
    
    var menuID: Int
    
    ///extracts the menu item name based on `menuID`
    var name: String {
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem() {
        orderModel.add(menuID: menuID, size: size, quantity: quantity)
        isPresented = false
    }
    
    var body: some View {
        VStack{
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
            Divider()
            SelectedImageView(imageName: "\(menuID)_250w")
                .padding(10)
            Divider()
            Text("Confirm your order of \(quantity) \(name) pizza")
                .font(.headline)
            Spacer()
            Button(action: addItem){
                Text("Add")
                    .font(.title)
                .padding()
                .background(Color("G4"))
                .cornerRadius(10)
            }.padding([.bottom])
        }
        .background(Color("G3"))
        .foregroundColor(Color("IP"))
        .cornerRadius(20)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(orderModel: OrderModel(), isPresented: .constant(true), quantity: .constant(1), size: .constant(.medium), menuID: 0)
    }
}
