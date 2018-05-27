//
//  TripsMapViewController.swift
//  tripApp
//
//  Created by 王雨薇 on 2018/5/25.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TripsMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?

    @IBOutlet weak var tripsMap: MKMapView!
    var myTrips: [Trip] = [Trip]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsMap.delegate = self
        locationManager = CLLocationManager.init()
        locationManager?.delegate = self
        
        tripsMap.showsUserLocation = true
        myTrips = Trips.getTrips()
        for trip in myTrips{
            tripsMap.addAnnotation(trip)
        }
        locationManager?.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        <#code#>
    }
*/
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var tripView = mapView.dequeueReusableAnnotationView(withIdentifier: "tripPin")
        if tripView == nil{
            tripView = MKAnnotationView(annotation: annotation, reuseIdentifier: "tripPin")
        }
            let tripAnnotation = annotation as! Trip
            tripView?.image = tripAnnotation.img
            tripView?.annotation = tripAnnotation
            tripView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            tripView?.canShowCallout = true
        
        
        return tripView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let tripVC = self.storyboard?.instantiateViewController(withIdentifier: "tripDetails") as!
        TripDetailsViewController
        tripVC.trip = view.annotation as! Trip
        self.present(tripVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
