//
//  Utilities.swift
//  Lottery
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit

func getDateStrFromTimeStamp(timeInterval:TimeInterval) -> String{

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.timeZone = TimeZone(identifier: "Asia/Singapore")
    
    return dateFormatter.string(from: NSDate(timeIntervalSince1970: timeInterval) as Date)
}


