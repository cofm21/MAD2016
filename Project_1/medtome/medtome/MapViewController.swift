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
        
        let kk = Dispensary(title: "Karing Kind", coordinate: CLLocationCoordinate2D(latitude: 40.080980, longitude: -105.281145), subtitle: "A high-end dispensary with expensive products.")
        let trill = Dispensary(title: "Trill Alternatives", coordinate: CLLocationCoordinate2D(latitude: 40.019390, longitude: -105.275184), subtitle: "A medical dispensary and personal favorite.")
        let terrapin = Dispensary(title: "Terrapin Recreational", coordinate: CLLocationCoordinate2D(latitude: 40.025515, longitude: -105.264663), subtitle: "A 21+ dispensary with great prices.")
        let dandelion = Dispensary(title: "The Dandelion", coordinate: CLLocationCoordinate2D(latitude: 40.016371, longitude: -105.284096), subtitle: "Famous for it's in house strains.")

        
        map.addAnnotations([kk, trill, terrapin, dandelion])
        
        let latDelta:CLLocationDegrees = 0.1
        
        let lonDelta:CLLocationDegrees = 0.1
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        /* BOULDER */
        let latitude:CLLocationDegrees = 40.0274
        
        let longitude:CLLocationDegrees = -105.2519
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        /* ------ */
        
                
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
        

        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        let identifier = "Dispensary"

        if annotation.isKindOfClass(Dispensary.self) {

            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            
            if annotationView == nil {
                // Apple's annotations can be on the stack, therefore as long as annotationView is nil,
                // add annotations with .DetailDisclosure
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let detail = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = detail
                
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