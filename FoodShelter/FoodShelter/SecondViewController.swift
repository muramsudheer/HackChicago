//
//  secondViewController.swift
//  test
//
//  Created by user142597 on 7/21/18.
//  Copyright © 2018 user142597. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var theMap: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        rLat = rLat / 69
        rLong = rLong / 69
        var centerLocation = CLLocationCoordinate2DMake(CLLocationDegrees(Lat), CLLocationDegrees(Long))
        var mapSpan=MKCoordinateSpanMake(rLat, rLong)
        var mapRegion=MKCoordinateRegionMake(centerLocation, mapSpan)
        self.theMap.setRegion(mapRegion, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        let coords = [CLLocation(latitude: 43, longitude: -88), CLLocation(latitude: 43.05, longitude: -88.05), CLLocation(latitude: 43.1, longitude: -88.1)];
        
        func addAnnotations(coords: [CLLocation]) {
            for coord in coords {
                let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude, longitude: coord.coordinate.longitude);
                let anno = MKPointAnnotation();
                anno.coordinate = CLLCoordType;
                theMap.addAnnotation(anno);
            }
        }

        addAnnotations(coords: coords)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
