//
//  WeatherTableHeaderView.swift
//  Weather-Swift
//
//  Created by zdq on 29/3/17.
//  Copyright © 2017 zdq. All rights reserved.
//

import UIKit

class WeatherTableHeaderView: UIView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    var condition: Condition? {
        didSet{
            self.dateLabel.text = getDateStrFromTimeStamp(timeInterval: (condition?.time)!)
            self.tempLabel.text = String(format: "%0.2f",(condition?.temperature)!)
            self.conditionLabel.text = condition?.icon
        }
    }
    
}
