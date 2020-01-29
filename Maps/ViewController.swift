//
//  ViewController.swift
//  Maps
//
//  Created by Rasyid Respati Wiriaatmaja on 29/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var mapIos: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //atur tipe map
        mapIos.mapType = .standard
        
        //atur lat & long
        let coordinate = CLLocationCoordinate2D(latitude: -6.7198822, longitude: 106.9490704)
        
        //atur zoom
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //tandai lokasi
        mapIos.region = MKCoordinateRegion(center: coordinate, span: span)
        
        //buat marker
        let marker = MKPointAnnotation()
        marker.title = "Your current location"
        marker.subtitle = "Your location"
        marker.coordinate = coordinate
        
        //tampilkan di map
        mapIos.addAnnotation(marker)
        
    }
    
    
}

