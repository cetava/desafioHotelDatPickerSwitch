//
//  HotelRJ.swift
//  HotelDatPickerSwitch
//
//  Created by Cesar A. Tavares on 10/9/20.
//

import Foundation

class HotelRJ {
    
    var name: String
    var classification: Int
    var weekDaysValue: Double
    var weekendValues: Double
    var rewardClientWeekDaysValue: Double
    var rewardClientWeekendValue: Double
    
    init(name: String, classification: Int, weekDaysValue: Double, weekendValues: Double, rewardClientWeekDaysValue: Double, rewardClientWeekendValue: Double) {
        self.name = name
        self.classification = classification
        self.weekDaysValue = weekDaysValue
        self.weekendValues = weekendValues
        self.rewardClientWeekDaysValue = rewardClientWeekDaysValue
        self.rewardClientWeekendValue = rewardClientWeekendValue
    }
    
    func checkValue(weekDays: Int, weekends: Int, weekDaysValue: Double, weekendValues: Double) -> Double {
        
        let result = ((Double(weekDays) * weekDaysValue) + (Double(weekends) * weekendValues))

        return result
    }
    
}
