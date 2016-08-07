//
//  DetailViewController.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var clinic: Clinic?
    
    @IBOutlet weak var clinicNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationDistanceLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let clinic = clinic {
            self.title = clinic.getName()
            clinicNameLabel.text = clinic.getName()
            addressLabel.text = "\(clinic.getStreetName())\n\(clinic.getCity()), \(clinic.getStateCode()) \(clinic.getPostalCode())"
            locationDistanceLabel.text = "\(Constants.locationDistance) \(clinic.getDistance().description) miles"
            mapButton.layerGradient("#8ebafa", hex2: "#4f81be")
            mapButton.layer.borderWidth = 1
            mapButton.layer.borderColor = UIColor(rgba: "#5284c2").CGColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seeOnMap(sender: AnyObject) {
        performSegueWithIdentifier(Constants.detailToMapSegue, sender: self.clinic)
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.detailToMapSegue{
            let mapViewController = segue.destinationViewController as! MapViewController
            mapViewController.clinic = sender as? Clinic
        }
    }

}
