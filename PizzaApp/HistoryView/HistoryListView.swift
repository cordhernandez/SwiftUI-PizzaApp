//
//  HistoryListView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 2/5/22.
//

import SwiftUI

struct HistoryListView: View {
    
    @ObservedObject var historyModel = HistoryModel()
    @Binding var imageID: Int
    
    var body: some View {
        NavigationView {
            List(historyModel.historyItems) { item in
                NavigationLink {
                    HistoryDetailView(historyItem: item, imageID: $imageID)
                } label: {
                    HistoryRowView(historyItem: item)
                }
            }
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    
    static var previews: some View {
        HistoryListView(historyModel: HistoryModel(), imageID: .constant(0))
    }
}
