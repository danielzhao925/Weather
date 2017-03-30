//
//  Utilities.swift
//  Lottery
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit

final class Utilities: NSObject {
    
    var timezone = "Asia/Singapore"
    
    static let sharedInstance: Utilities = Utilities()
    private override init() { }
}

func getDateStrFromTimeStamp(timeInterval:TimeInterval) -> String{

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = TimeZone(identifier: Utilities.sharedInstance.timezone)
    
    return dateFormatter.string(from: NSDate(timeIntervalSince1970: timeInterval) as Date)
}


