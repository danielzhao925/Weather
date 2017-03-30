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
        temperature  <- map["temperature"]
        summary      <- map["summary"]
        icon         <- map["icon"]
    }
}

class WeatherItem: Mappable  {
    
    var timezone: String?
    var currently: Condition?
    var hourly: [Condition]?

    public required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        timezone    <- map["timezone"]
        currently    <- map["currently"]
        hourly       <- map["hourly.data"]
    }

}

