//
//  WeatherTableViewController.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit
import CoreLocation

let weatherTableViewCell = "WeatherTableViewCell"

class WeatherTableViewController: UITableViewController {
    
    @IBOutlet weak var weatherTableHeaderView: WeatherTableHeaderView!
    var locationManager: CLLocationManager = CLLocationManager()
    var forecastArray: [Condition]?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.weatherTableHeaderView)")
        self.title = "Weather";
        
        let status  = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        // 4
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func updateWeather(locationStr:String, finished:(() -> Void)? = nil) {
        
        WebServiceManager.shareWebServiceManager.getWeather(locationStr: locationStr,finished: { (response) in
                        
            let weatherItem:WeatherItem = WeatherItem(JSON: response)!

            if let timezone:String = weatherItem.timezone {
                Utilities.sharedInstance.timezone = timezone
            }

            if let condition:Condition = weatherItem.currently ,
                let forecastArray:[Condition] = weatherItem.hourly
                {
                    self.weatherTableHeaderView.condition = condition
                    self.forecastArray = forecastArray
                    self.tableView.reloadData()
                }
            
            if let finished = finished{
                finished()
            }
            
        })
    }
}

extension WeatherTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let forecastArray = self.forecastArray {
            return forecastArray.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: weatherTableViewCell) as! WeatherTableViewCell
        if let forecast: Condition = self.forecastArray?[indexPath.row] {
                cell.forecast = forecast
        }
        return cell
       
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 109
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}

extension WeatherTableViewController:CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last!
        print("Current location: \(currentLocation)")
        
        let locationStr = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
        
        self.updateWeather(locationStr: locationStr);
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
