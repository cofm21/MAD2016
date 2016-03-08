//
//  Dispensary.swift
//  medtome
//
//  Created by Connor McGuinness on 3/7/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import MapKit
import UIKit

class Dispensary: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
