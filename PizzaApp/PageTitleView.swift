//
//  PageTitleView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct PageTitleView: View {
    
    var title: String
    var isDisplayingOrders: Bool! = nil
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.trailing)
        }
        .overlay(
            Image(systemName: isDisplayingOrders ?? false ? "chevron.up.square" : "chevron.down.square" )
                .font(.title)
                .padding()
                .foregroundColor(isDisplayingOrders != nil ? Color("G1") : .clear)
            , alignment: .leading
        )
        .foregroundColor(Color("G1"))
        .background(Color("G4"))
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Pizza History")
    }
}
