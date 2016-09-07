//
//  MapViewController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/15/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
enum MapType: Int {
    case Standard = 0
    case Hybrid
    case Satellite
}
class MapViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    
    var NumberOfRows = 0
    var latitude:Double = 0
    var longitude:Double = 0
    var supplier:String = ""
    var location:String = ""
    var timing:String = ""
    
    
    var pins = [MapData]()
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func updateMapOverlay(sender: AnyObject) {
        let mapType = MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex)
        switch (mapType!) {
        case .Standard:
            mapView.mapType = MKMapType.Standard
        case .Hybrid:
            mapView.mapType = MKMapType.Hybrid
        case .Satellite:
            mapView.mapType = MKMapType.Satellite
        }
    }
    override func viewDidLoad() {
      
        mapView.delegate = self
        
        super.viewDidLoad()
        self.mapView.region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 40.351593,longitude: -94.883144), 100,100)
        
//        var circle=MKCircle(centerCoordinate: CLLocationCoordinate2D(latitude: 48.85, longitude:2.35), radius: 5000)
//        
//        self.mapView.addOverlay(circle)
        
        parseJson()
        self.mapView.addAnnotations(pins)
        
        
    }
    
    // function to pars json
    func parseJson(){
      
        if let path = NSBundle.mainBundle().pathForResource("maps", ofType: "json")
        {

            
            if let jsonData = try? NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            {
                
                if let jsonResult: NSArray = (try? NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)) as? NSArray
                {
                     print("Hello")
                    
                    print(jsonResult.count)
                    
                    NumberOfRows = jsonResult.count
                    for item in jsonResult{
                        supplier = item["Supplier"] as! String
                        location = item["Location"] as! String
                        timing = item["Timings"] as! String
                        latitude = item["Latitude"] as! Double
                        
                        longitude = item["Longitude"] as! Double
                        
                        let abc:MapData = MapData(title: supplier, subtitle: location, timing:  timing, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                        
                        pins.append(abc)
                        print(pins.count)
                    }
                }
            }
        }
    }
    
    //function to display circle
    
//    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
//        
//        var circleRenderer = MKCircleRenderer(overlay: overlay)
//        circleRenderer.fillColor = UIColor.grayColor()
//        circleRenderer.strokeColor = UIColor.yellowColor()
//        circleRenderer.lineWidth = 2
//        
//        return circleRenderer
//        
//    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        var pinView:MKPinAnnotationView! =
        mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as! MKPinAnnotationView!
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pinView.pinColor = MKPinAnnotationColor.Green
            pinView.canShowCallout = true
        }
        return pinView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
}


