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
    @State var comments: String = ""
    
    var menuID: Int
    
    ///extracts the menu item name based on `menuID`
    var name: String {
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem() {
        orderModel.add(menuID: menuID, size: size, quantity: quantity, comments: comments)
        isPresented = false
    }
    
    var body: some View {
        VStack {
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
            
            Divider()
            
            SelectedImageView(imageName: "\(menuID)_250w")
                .padding(10)
                .gesture(TapGesture(count: 2).onEnded({ _ in
                    self.isPresented = false
                }))
            
            Divider()
            
            Text("Confirm your order of \(quantity) \(name) pizza")
                .font(.headline)
            TextField("Add your comments here", text: $comments)
                .background(Color("G4"))
            
            SizePickerView(size: $size)
            
            QuantityStepperView(quantity: $quantity)
            Spacer()
            
            HStack {
                Button(action: addItem){
                    Text("Add")
                        .font(.title)
                        .padding()
                        .background(Color("G4"))
                        .cornerRadius(10)
                }.padding([.bottom, .leading])
                Spacer()
                Button {
                    self.isPresented = false
                } label: {
                    Text("Cancel")
                        .font(.title)
                        .padding()
                        .background(Color("G4"))
                        .cornerRadius(10)
                }.padding([.bottom, .trailing])
            }
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
