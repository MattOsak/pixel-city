//
//  ViewController.swift
//  pixel-city
//
//  Created by Matt Osak on 2018-01-15.
//  Copyright © 2018 Matt Osak. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import AlamofireImage



class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pullUpViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pullUpView: UIView!
    let regionRadius: Double = 1000
    

    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        
    }

    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            centerMapOnUserLocation()
        }
    }

}
extension MapVC: MKMapViewDelegate {

    func centerMapOnUserLocation () {
        guard let corrdinate = locationManager.location?.coordinate else { return }
        let corrdinateRegion = MKCoordinateRegionMakeWithDistance(corrdinate, regionRadius * 2.0 , regionRadius * 2.0)
        mapView.setRegion(corrdinateRegion, animated: true)
        
    }
    
}

extension MapVC: CLLocationManagerDelegate {
    
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
}
