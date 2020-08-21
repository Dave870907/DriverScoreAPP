//
//  mapView2.swift
//  project1
//
//  Created by 吳冠緯 on 2020/8/10.
//  Copyright © 2020 吳冠緯. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class mapView2: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theMap: MKMapView!
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
override func viewDidLoad() {
super.viewDidLoad()
//Setup our Location Manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
//Setup our Map View
        theMap.delegate = self
        theMap.mapType = MKMapType.standard
        theMap.showsUserLocation = true
    }
func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        theLabel.text = "\(locations[0])"
    myLocations.append(locations[0] as! CLLocation)
let spanX = 0.007
let spanY = 0.007
    let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpan (latitudeDelta: spanX, longitudeDelta: spanY))
        theMap.setRegion(newRegion, animated: true)
if (myLocations.count > 1){
    let sourceIndex = myLocations.count - 1
    let destinationIndex = myLocations.count - 2
let c1 = myLocations[sourceIndex].coordinate
let c2 = myLocations[destinationIndex].coordinate
var a = [c1, c2]
    let polyline = MKPolyline(coordinates: &a, count: a.count)
            theMap.addOverlay(polyline)
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
if overlay is MKPolyline {
    let polylineRenderer = MKPolylineRenderer(overlay: overlay)
    polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 4
return polylineRenderer
        }
return MKPolylineRenderer()
    }
}
