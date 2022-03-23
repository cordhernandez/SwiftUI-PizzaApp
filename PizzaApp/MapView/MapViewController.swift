//
//  ViewController.swift
//  HistoryMap
//
//  Created by Steven Lipton on 9/19/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let mapView = MKMapView()
    
    var latitude: CLLocationDegrees = 40.8371
    var longitude: CLLocationDegrees = 14.2467
    var regionRadius: CLLocationDistance = 1000000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.frame = view.frame
        configureRegion()
        view.addSubview(mapView)
    }
    
    func updateMap() {
        mapView.frame = view.frame
        configureRegion()
        view.addSubview(mapView)
    }
    
    func configureRegion() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region,animated: true)
        configureAnnotation(with: coordinate)
    }
    
    func configureAnnotation(with coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
}

