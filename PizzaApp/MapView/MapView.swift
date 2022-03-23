//
//  MapView.swift
//  PizzaApp
//
//  Created by Cordero Hernandez on 3/23/22.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    var latitude: Double
    var longitude: Double
    var regionRadius: Double
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        uiView.setRegion(region,animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
    
    func makeCoordinator() -> () {
        
    }
}
