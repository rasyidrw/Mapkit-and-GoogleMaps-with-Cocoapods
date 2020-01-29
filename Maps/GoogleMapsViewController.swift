//
//  GoogleMapsViewController.swift
//  Maps
//
//  Created by Rasyid Respati Wiriaatmaja on 29/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController, CLLocationManagerDelegate {
    
    var gps = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //atur gps
        gps.delegate = self
        gps.startUpdatingLocation()
        gps.requestLocation()
        gps.requestWhenInUseAuthorization()
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lat = locations.last?.coordinate.latitude
        let long = locations.last?.coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude: long!, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
