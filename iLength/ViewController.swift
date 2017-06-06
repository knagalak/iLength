//
//  ViewController.swift
//  iLength
//
//  Created by Kavya Nagalakunta on 6/6/17.
//  Copyright © 2017 Kavya Nagalakunta. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    

    
    var time :Int = 1
    
    var locManager = CLLocationManager()
    var firstLocation: CLLocationCoordinate2D!
    var secondLocation: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.distanceFilter = 0.00000000000000000000000001
        locManager.activityType = .fitness
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        
        if time == 1{
            if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
                firstLocation = locManager.location?.coordinate
            }

            lengthLabel.text = String(firstLocation.latitude) + " " + String(firstLocation.longitude)
            pointLabel.text = "Ending Point"
            time = 2
            
            
        } else {
            
            if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
                secondLocation = locManager.location?.coordinate
            }

            
            //let distanceInMeters = firstLocation.distance(from: secondLocation)
            //lengthLabel.text = String(distanceInMeters)
            
            lengthLabel.text = lengthLabel.text! + "\n" + String(secondLocation.latitude) + " " + String(secondLocation.longitude)
            
            print(String(describing: lengthLabel.text))
            time = 1
            pointLabel.text = "Starting Point"

        }
        
        
    }

}

