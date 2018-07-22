//
//  secondViewController.swift
//  test
//
//  Created by user142597 on 7/21/18.
//  Copyright © 2018 user142597. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class SecondViewController: UIViewController {
    
    @IBOutlet weak var theMap: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        theMap.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
        rLat = rLat / 69
        rLong = rLong / 69
        
        
        var centerLocation = CLLocationCoordinate2DMake(CLLocationDegrees(Lat), CLLocationDegrees(Long))
        var mapSpan=MKCoordinateSpanMake(rLat, rLong)
        var mapRegion=MKCoordinateRegionMake(centerLocation, mapSpan)
        self.theMap.setRegion(mapRegion, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        let coords = [CLLocation(latitude: Lat, longitude: Long)];
        
        func addAnnotations(coords: [CLLocation]) {
            for coord in coords {
                let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude, longitude: coord.coordinate.longitude);
                let anno = MKPointAnnotation();
                anno.coordinate = CLLCoordType;
                self.theMap.addAnnotation(anno);
            }
        }
        
        self.searchFunction()
    }
}
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchFunction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "food pantry"
        request.region = self.theMap.region
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            if error != nil {
                print("Error")
            } else {
                for item in response!.mapItems {
                    let CLLCoordType2 = CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude, longitude: item.placemark.coordinate.longitude);
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLCoordType2
                    annotation.title = item.name
                    annotation.subtitle = item.phoneNumber
                    self.theMap.addAnnotation(annotation);
                    
                    }
                }
            }
        }
    }
    
}

extension SecondViewController: MKMapViewDelegate {
    func mapView(_ theMap: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else {return nil}
        let identifier = "marker"
        var view: MKMarkerAnnotationView; UIControl()
        if let dequedView = theMap.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequedView.annotation = annotation
            view = dequedView
        }
        else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        return view
    }
    
    private func mapView(_ theMap: MKMapView, anotationView view: MKMarkerAnnotationView, calloutAcceessoryControlTapped control: UIControl) {
        print("yes but no")
        if control == view.rightCalloutAccessoryView {
            print("you clciked it!")
        }
    }
    
}

