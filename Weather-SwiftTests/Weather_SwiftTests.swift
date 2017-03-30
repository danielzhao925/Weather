//
//  Weather_SwiftTests.swift
//  Weather-SwiftTests
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit
import XCTest
import ObjectMapper
@testable import Weather_Swift
import Nimble

class Weather_SwiftTests: XCTestCase {
    
    var viewController: WeatherTableViewController!

    override func setUp() {
        super.setUp()
         viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherTableViewController") as! WeatherTableViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWhenWeatherItemIsNil(){
        viewController.forecastArray = nil
        viewController.tableView.reloadData()
    }
    
    func testWeatherItemStruct() {
    
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json"),
            let data = try? Data(contentsOf: fileUrl) {
            do {
                if let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let weatherItem:WeatherItem = WeatherItem(JSON: response)!
                    expect(weatherItem.timezone).to(equal("Asia/Singapore"))
                    expect(self.dataPointValid(weatherItem.currently!)).to(beTruthy())
                    expect(weatherItem.hourly).to(beAKindOf([Condition].self));
                    for condition in weatherItem.hourly! {
                        expect(self.dataPointValid(condition)).to(beTruthy())
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func testWeatherWhenLocationChange() {
        var locationStr = "1.375929,103.836879"
        viewController.updateWeather(locationStr: locationStr) { 
            expect(Utilities.sharedInstance.timezone).to(equal("Asia/Singapore"))
        }
  
        locationStr = "1.5544755,103.4347566"
        viewController.updateWeather(locationStr: locationStr) {
            expect(Utilities.sharedInstance.timezone).to(equal("Asia/Kuala_Lumpur"))
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    fileprivate func dataPointValid(_ condition: Condition?) -> Bool {
        return condition?.summary != nil || condition?.icon != nil || condition?.time != nil || condition?.temperature != nil
    }
    
}
