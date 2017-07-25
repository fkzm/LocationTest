//
//  ViewController.swift
//  locationTest
//
//  Created by Fateme' Kazemi on 5/2/1396 AP.
//  Copyright © 1396 Fateme' Kazemi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{

    
    var locManager = CLLocationManager()
    var currentLocation = CLLocation()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
   
    var lat = String()
    var log = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.delegate = self
        
    }

    @IBAction func onGetLocation(_ sender: Any) {

        self.locManager.allowsBackgroundLocationUpdates = true
        self.locManager.startUpdatingLocation()

        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            if(locManager.location != nil){
                  currentLocation = locManager.location!
                
                lat = lat + currentLocation.coordinate.latitude.description
                log = log + currentLocation.coordinate.longitude.description
                
                label1.text = lat
                label2.text = log
                
            }
          
            
        }
       
        
    }
    
    


}

