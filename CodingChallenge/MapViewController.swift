//
//  MapViewController.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var clinic:Clinic?
    var location:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.map
        
        if let clinic = clinic {
            location = CLLocation(latitude: clinic.getLatitude(), longitude: clinic.getLongtitude())
            centerMapOnLocation(location!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location:CLLocation){
        let regionRadius:CLLocationDistance = 2000
        let currentAnnotation = MKPointAnnotation()
        
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        
        currentAnnotation.coordinate = location.coordinate
        mapView.addAnnotation(currentAnnotation)
    }
    

}
