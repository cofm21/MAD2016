//
//  MapViewController.swift
//  medtome
//
//  Created by Connor McGuinness on 3/2/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latDelta:CLLocationDegrees = 0.1
        
        let lonDelta:CLLocationDegrees = 0.1
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        /* BOULDER */
        let latitude:CLLocationDegrees = 40.0274
        
        let longitude:CLLocationDegrees = -105.2519
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        /* ------ */
        
        /* Karing Kind */
        let kkLat:CLLocationDegrees = 40.080980
        
        let kkLon:CLLocationDegrees = -105.281145
        
        let kkLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(kkLat, kkLon)
        
        let kkAnnotation = MKPointAnnotation()
        kkAnnotation.coordinate = kkLoc
        kkAnnotation.title = "Karing Kind"
        kkAnnotation.subtitle = "A great dispensary"
        map.addAnnotation(kkAnnotation)
        /* ------ */
        
        /* Trill Alternatives */
        let trillLat:CLLocationDegrees = 40.019390
        
        let trillLon:CLLocationDegrees = -105.275184
        
        let trillLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(trillLat, trillLon)
        
        let trillAnnotation = MKPointAnnotation()
        trillAnnotation.coordinate = trillLoc
        trillAnnotation.title = "Trill Alternatives"
        trillAnnotation.subtitle = "A medical dispensary and personal favorite"
        map.addAnnotation(trillAnnotation)
        /* ------ */
        
        /* Terrapin */
        let terrapinLat:CLLocationDegrees = 40.025515
        
        let terrapinLon:CLLocationDegrees = -105.264663
        
        let terrapinLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(terrapinLat, terrapinLon)
        
        let terrapinAnnotation = MKPointAnnotation()
        terrapinAnnotation.coordinate = terrapinLoc
        terrapinAnnotation.title = "Terrapin Recreational"
        terrapinAnnotation.subtitle = "A 21+ dispensary with great prices"
        map.addAnnotation(terrapinAnnotation)
        /* ------ */
        
        /* Dandelion */
        let dandelionLat:CLLocationDegrees = 40.016371
        
        let dandelionLon:CLLocationDegrees = -105.284096
        
        let dandelionLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(dandelionLat, dandelionLon)
        
        let dandelionAnnotation = MKPointAnnotation()
        dandelionAnnotation.coordinate = dandelionLoc
        dandelionAnnotation.title = "The Dandelion"
        dandelionAnnotation.subtitle = "Famous for it's in house strains"
        map.addAnnotation(dandelionAnnotation)
        /* ------ */
        
        /* My Location */
        let driverLat:CLLocationDegrees = 40.029092
        
        let driverLon:CLLocationDegrees = -105.258605
        
        let driverLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(driverLat, driverLon)
        
        let driverAnnotation = MKPointAnnotation()
        driverAnnotation.coordinate = driverLoc
        driverAnnotation.title = "I am a driver"
        driverAnnotation.subtitle = "here is my route to the dispensary"
        map.addAnnotation(driverAnnotation)
        /* ------ */
        
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var location = CLLocationCoordinate2D(
            latitude: -73.761105,
            longitude: 41.017791
        )
        
        
        var locations = [CLLocation(latitude: 40.025515, longitude: -105.264663), CLLocation(latitude: 40.029092,longitude: -105.258605)]
        var coordinates = locations.map({(location: CLLocation!) -> CLLocationCoordinate2D in return location.coordinate})
        var polyline = MKPolyline(coordinates: &coordinates, count: locations.count)
        
        self.map.addOverlay(polyline)
        
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        }
        
        return nil
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}