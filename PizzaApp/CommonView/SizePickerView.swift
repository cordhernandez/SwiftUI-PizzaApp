//
//  SizePickerView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 3/22/22.
//

import SwiftUI

struct SizePickerView: View {
    
    let sizes: [Size] = [.small, .medium, .large]
    @Binding var size: Size
    
    var body: some View {
        Picker(selection: $size, content: {
            ForEach(sizes, id: \.self) { size in
                Text(size.formatted()).tag(size)
            }
        }, label: {
            Text("Pizza Size")
        }).pickerStyle(.segmented)
    }
}

struct SizePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SizePickerView(size: .constant(.medium))
    }
}
