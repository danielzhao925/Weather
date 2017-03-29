//
//  WeatherObjects.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import Foundation
import ObjectMapper

class Condition: Mappable  {
    
    var time: Double?
    var temperature: Float?
    var summary: String?
    
    var icon: String?
    
    public required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        time         <- map["time"]
        temperature         <- map["temperature"]
        summary         <- map["summary"]
        icon         <- map["icon"]
    }
}

//class Forecast: Mappable  {
//    
//    var code: String?
//    var date: String?
//    var day: String?
//    var high: String?
//    var low: String?
//    var text: String?
//    
//    public required init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    func mapping(map: Map) {
//        code         <- map["code"]
//        date         <- map["date"]
//        day          <- map["day"]
//        high         <- map["high"]
//        low          <- map["low"]
//        text         <- map["text"]
//    }
//}

class WeatherItem: Mappable  {
    
    var currently: Condition?
    var hourly: [Condition]?

    public required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        currently    <- map["currently"]
        hourly       <- map["hourly.data"]
    }

}

