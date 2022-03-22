//
//  QuantityStepperView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 3/22/22.
//

import SwiftUI

struct QuantityStepperView: View {
    
    @Binding var quantity: Int
    
    var body: some View {
        Stepper(value: $quantity, in: 1...10, label: {
            Text("Quantity: \(quantity)")
                .bold()
        })
            .padding()
    }
}

struct QuantityStepperView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityStepperView(quantity: .constant(3))
    }
}
