//
//  MapViewController.swift
//  medtome
//
//  Created by Connor McGuinness on 3/2/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//  
//  References:
//      https://www.hackingwithswift.com/read/19/3/annotations-and-accessory-views-mkpinannotationview
//      https://www.udemy.com/the-complete-ios-9-developer-course/learn/#/
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kk = Dispensary(title: "Karing Kind", coordinate: CLLocationCoordinate2D(latitude: 40.080980, longitude: -105.281145), info: "A high-end dispensary with expensive products.")
        let trill = Dispensary(title: "Trill Alternatives", coordinate: CLLocationCoordinate2D(latitude: 40.019390, longitude: -105.275184), info: "A medical dispensary and personal favorite.")
        let terrapin = Dispensary(title: "Terrapin Recreational", coordinate: CLLocationCoordinate2D(latitude: 40.025515, longitude: -105.264663), info: "A 21+ dispensary with great prices.")
        let dandelion = Dispensary(title: "The Dandelion", coordinate: CLLocationCoordinate2D(latitude: 40.016371, longitude: -105.284096), info: "Famous for it's in house strains.")
        let driver = Dispensary(title: "I am a driver", coordinate: CLLocationCoordinate2D(latitude: 40.029092, longitude: -105.258605), info: "Here is my current location.")
        
        map.addAnnotations([kk, trill, terrapin, dandelion, driver])
        
        let latDelta:CLLocationDegrees = 0.1
        
        let lonDelta:CLLocationDegrees = 0.1
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        /* BOULDER */
        let latitude:CLLocationDegrees = 40.0274
        
        let longitude:CLLocationDegrees = -105.2519
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        /* ------ */
        
        
        /*
        /* Karing Kind */
        let kkLat:CLLocationDegrees = 40.080980
        
        let kkLon:CLLocationDegrees = -105.281145
        
        let kkLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(kkLat, kkLon)
        
        let kkAnnotation = MKPointAnnotation()
        kkAnnotation.coordinate = kkLoc
        kkAnnotation.title = "Karing Kind"
        kkAnnotation.subtitle = "A high-end dispensary with expensive products."
        self.map.addAnnotation(kkAnnotation)
        /* ------ */
        
        /* Trill Alternatives */
        let trillLat:CLLocationDegrees = 40.019390
        
        let trillLon:CLLocationDegrees = -105.275184
        
        let trillLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(trillLat, trillLon)
        
        let trillAnnotation = MKPointAnnotation()
        trillAnnotation.coordinate = trillLoc
        trillAnnotation.title = "Trill Alternatives"
        trillAnnotation.subtitle = "A medical dispensary and personal favorite."
        self.map.addAnnotation(trillAnnotation)
        /* ------ */
        
        /* Terrapin */
        let terrapinLat:CLLocationDegrees = 40.025515
        
        let terrapinLon:CLLocationDegrees = -105.264663
        
        let terrapinLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(terrapinLat, terrapinLon)
        
        let terrapinAnnotation = MKPointAnnotation()
        terrapinAnnotation.coordinate = terrapinLoc
        terrapinAnnotation.title = "Terrapin Recreational"
        terrapinAnnotation.subtitle = "A 21+ dispensary with great prices."
        self.map.addAnnotation(terrapinAnnotation)
        /* ------ */
        
        /* Dandelion */
        let dandelionLat:CLLocationDegrees = 40.016371
        
        let dandelionLon:CLLocationDegrees = -105.284096
        
        let dandelionLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(dandelionLat, dandelionLon)
        
        let dandelionAnnotation = MKPointAnnotation()
        dandelionAnnotation.coordinate = dandelionLoc
        dandelionAnnotation.title = "The Dandelion"
        dandelionAnnotation.subtitle = "Famous for it's in house strains."
        self.map.addAnnotation(dandelionAnnotation)
        /* ------ */
        
        /* Driver Location */
        let driverLat:CLLocationDegrees = 40.029092
        
        let driverLon:CLLocationDegrees = -105.258605
        
        let driverLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(driverLat, driverLon)
        
        let driverAnnotation = MKPointAnnotation()
        driverAnnotation.coordinate = driverLoc
        driverAnnotation.title = "I am a driver"
        driverAnnotation.subtitle = "Here is my current location."
        self.map.addAnnotation(driverAnnotation)
        /* ------ */
        */
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
        

        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        let identifier = "Dispensary"

        if annotation.isKindOfClass(Dispensary.self) {

            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            
            if annotationView == nil {

                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let btn = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else {
                
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        let dispensary = view.annotation as! Dispensary
        let placeName = dispensary.title
        //let placeInfo = dispensary.subtitle
        
        performSegueWithIdentifier(placeName!, sender: control)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}