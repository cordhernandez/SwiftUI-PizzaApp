//
//  PizzaHistoryView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct HistoryView: View {
    
    @State var imageID: Int = 0
    
    var body: some View {
        VStack {
//            ContentHeaderView()
            PageTitleView(title: "Pizza History")
            SelectedImageView(imageName: "\(imageID)_250w")
                .padding(5)
            HistoryListView(imageID: $imageID)
        }
    }
}

struct PizzaHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HistoryView()
            HistoryView()
                .preferredColorScheme(.dark)
        }
    }
}
