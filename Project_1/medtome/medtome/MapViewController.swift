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
        
        var latDelta:CLLocationDegrees = 0.1
        
        var lonDelta:CLLocationDegrees = 0.1
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        /* BOULDER */
        var latitude:CLLocationDegrees = 40.0274
        
        var longitude:CLLocationDegrees = -105.2519
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        /* ------ */
        
        /* Karing Kind */
        var kkLat:CLLocationDegrees = 40.080980
        
        var kkLon:CLLocationDegrees = -105.281145
        
        var kkLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(kkLat, kkLon)
        
        var kkAnnotation = MKPointAnnotation()
        kkAnnotation.coordinate = kkLoc
        kkAnnotation.title = "Karing Kind"
        kkAnnotation.subtitle = "A great dispensary"
        map.addAnnotation(kkAnnotation)
        /* ------ */
        
        /* Trill Alternatives */
        var trillLat:CLLocationDegrees = 40.019390
        
        var trillLon:CLLocationDegrees = -105.275184
        
        var trillLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(trillLat, trillLon)
        
        var trillAnnotation = MKPointAnnotation()
        trillAnnotation.coordinate = trillLoc
        trillAnnotation.title = "Trill Alternatives"
        trillAnnotation.subtitle = "A medical dispensary and personal favorite"
        map.addAnnotation(trillAnnotation)
        /* ------ */
        
        /* Terrapin */
        var terrapinLat:CLLocationDegrees = 40.025515
        
        var terrapinLon:CLLocationDegrees = -105.264663
        
        var terrapinLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(terrapinLat, terrapinLon)
        
        var terrapinAnnotation = MKPointAnnotation()
        terrapinAnnotation.coordinate = terrapinLoc
        terrapinAnnotation.title = "Terrapin Recreational"
        terrapinAnnotation.subtitle = "A 21+ dispensary with great prices"
        map.addAnnotation(terrapinAnnotation)
        /* ------ */
        
        /* Dandelion */
        var dandelionLat:CLLocationDegrees = 40.016371
        
        var dandelionLon:CLLocationDegrees = -105.284096
        
        var dandelionLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(dandelionLat, dandelionLon)
        
        var dandelionAnnotation = MKPointAnnotation()
        dandelionAnnotation.coordinate = dandelionLoc
        dandelionAnnotation.title = "The Dandelion"
        dandelionAnnotation.subtitle = "Famous for it's in house strains"
        map.addAnnotation(dandelionAnnotation)
        /* ------ */
        
        /* My Location */
        var driverLat:CLLocationDegrees = 40.029092
        
        var driverLon:CLLocationDegrees = -105.258605
        
        var driverLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(driverLat, driverLon)
        
        var driverAnnotation = MKPointAnnotation()
        driverAnnotation.coordinate = driverLoc
        driverAnnotation.title = "I am a driver"
        driverAnnotation.subtitle = "here is my route to the dispensary"
        map.addAnnotation(driverAnnotation)
        /* ------ */
        
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let location = CLLocationCoordinate2D(
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