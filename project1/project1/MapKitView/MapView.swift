//
//  MapView.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/9.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager: CLLocationManager!
    @IBOutlet var mapView : MKMapView!
    var previousLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.delegate = self;
        // Do any additional setup after loading the view.
        // user activated automatic authorization info mode
        var status = CLLocationManager.authorizationStatus()
        if status == .notDetermined || status == .denied || status == .authorizedWhenInUse {
               // present an alert indicating location authorization required
               // and offer to take the user to Settings for the app via
               // UIApplication -openUrl: and UIApplicationOpenSettingsURLString
               locationManager.requestAlwaysAuthorization()
               locationManager.requestWhenInUseAuthorization()
           }
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        //mapview setup to show user location
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = MKMapType(rawValue: 0)!
        mapView.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!){
        print("present location : (newLocation.coordinate.latitude),(newLocation.coordinate.longitude)")
        //drawing path or route covered
        if let oldLocationNew = oldLocation as CLLocation?{
             let oldCoordinates = oldLocationNew.coordinate
             let newCoordinates = newLocation.coordinate
             var area = [oldCoordinates, newCoordinates]
             var polyline = MKPolyline(coordinates: &area, count: area.count)
             mapView.addOverlay(polyline)
         }
       

    }
    func mapView(_ mapView: MKMapView!, rendererFor overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay is MKPolyline) {
            var pr = MKPolylineRenderer(overlay: overlay)
            pr.strokeColor = UIColor.red
            pr.lineWidth = 5
            return pr
        }
        return nil
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
