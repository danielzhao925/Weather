//
//  WeatherTableViewCell.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    var forecast: Condition? {
        didSet{
            self.dateLabel.text = getDateStrFromTimeStamp(timeInterval: (forecast?.time)!)
            self.tempLabel.text = String(format: "%0.2f",(forecast?.temperature)!)
            self.conditionLabel.text = forecast?.icon
        }
    }
    
}
