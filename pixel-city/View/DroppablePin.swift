//
//  DroppablePin.swift
//  pixel-city
//
//  Created by Matt Osak on 2018-01-17.
//  Copyright © 2018 Matt Osak. All rights reserved.
//

import UIKit
import MapKit

class DroppablePin: NSObject, MKAnnotation {
   
    dynamic var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
    
    
}
