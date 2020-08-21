//
//  MapKitView.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/8.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKitView: UIViewController {

  @IBOutlet var myMapView : MKMapView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */  let locationManager = CLLocationManager()
   let regionInMeters: Double = 10000
    
      func setupLocationManager(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        
      func checkLocationServices(){
              if CLLocationManager.locationServicesEnabled(){
      //            setup our location manager
                  setupLocationManager()
                 checkLocationAuthorization()
              }else{
                  //show alert letting the user know they have to turn this on
              }
          }
          
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            myMapView.setRegion(region, animated: true)
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            myMapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
//        var speed: CLLocationSpeed{get}
      
    }
    
  
   
    
    
   
    
}

// for user's location updating when they move
extension MapKitView: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//       we'll be back
        guard let location  = locations.last else{return}
        let center = CLLocationCoordinate2D(latitude:location.coordinate.latitude ,longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center:center ,latitudinalMeters:regionInMeters,longitudinalMeters:regionInMeters)
        myMapView.setRegion(region,animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        checkLocationAuthorization()
    }
}

