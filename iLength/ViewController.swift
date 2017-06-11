//
//  ViewController.swift
//  iLength
//
//  Created by Kavya Nagalakunta on 6/6/17.
//  Copyright © 2017 Kavya Nagalakunta. All rights reserved.
//

import UIKit
import Foundation
import MapKit




class ViewController: UIViewController {
    
    
    @IBOutlet weak var coordinateLabel: UILabel!
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
    
    

    func formulaCalculate() -> Double {
        
        let earthRadius : Double = 6371.008
        
        let lat : Double = (secondLocation.latitude.toRadians() - firstLocation.latitude.toRadians())
        let long : Double = (secondLocation.longitude.toRadians() - firstLocation.longitude.toRadians())
        
        let startLat : Double = firstLocation.latitude.toRadians()
        let endLat : Double = secondLocation.latitude.toRadians()
        
        let a : Double = haversin(value: lat) + cos(startLat) * cos(endLat) * haversin(value: long);
        let c: Double = 2 * atan2(sqrt(a),sqrt(1 - a));
        
        return earthRadius * c; // <-- d
    }
    

    
    func haversin(value: Double) -> Double {
        
        return pow(sin(value/2.0),2.0)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        if time == 1{
            if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
                firstLocation = locManager.location?.coordinate
            }

            lengthLabel.text = "0.00 m"

            pointLabel.text = "Ending Point"
            time = 2
            
            
        } else {
            
            if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
                secondLocation = locManager.location?.coordinate
            }

            lengthLabel.text = String(formulaCalculate()*100) + " m"
            time = 1
            pointLabel.text = "Starting Point"

        }
        
        
    }
    
    
    

}

