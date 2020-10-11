//
//  ViewController.swift
//  HotelDatPickerSwitch
//
//  Created by Cesar A. Tavares on 10/9/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var rewardSwitch: UISwitch!
    @IBOutlet weak var labelBestHotel: UILabel!
    
    let parqueFlores = ParqueFlores(name: "Parque das Flores", classification: 3, weekDaysValue: 110, weekendValues: 90, rewardClientWeekDaysValue: 80, rewardClientWeekendValue: 80)
    let jardimBotanico = JardimBotanico(name: "Jardim Botanico", classification: 4, weekDaysValue: 160, weekendValues: 60, rewardClientWeekDaysValue: 110, rewardClientWeekendValue: 50)
    let marAtalntico = MarAtlantico(name: "Mar Atlântico", classification: 5, weekDaysValue: 220, weekendValues: 150, rewardClientWeekDaysValue: 100, rewardClientWeekendValue: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func actionButtonBestHotel(_ sender: Any) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.dateFormat = "dd/MM/yyyy"
                
        let strDateCheckIn = dateFormatter.string(from: checkInDatePicker.date)
        let strDateCheckOut = dateFormatter.string(from: checkOutDatePicker.date)
        var dateCheckIn = dateFormatter.date(from: strDateCheckIn)!
        let dateCheckOut = dateFormatter.date(from: strDateCheckOut)!
        
        var count: Int = 0
        var countDays: Int = 1
        var weekends: Int = 0
        var weekDays: Int = 0
        let calendar = Calendar.current
        let stays = Calendar.current.dateComponents([.day], from: dateCheckIn, to: dateCheckOut)
        
        var reservationValueParqueFlores: Double = 0
        var reservationValueJardimBotanico: Double = 0
        var reservationValueMarAtlantico: Double = 0
        
        countDays = countDays + Int(stays.day!)
        
        while count < countDays {
            if calendar.isDateInWeekend(dateCheckIn) {
                weekends = weekends + 1
            } else {
                weekDays = weekDays + 1
            }
            dateCheckIn = calendar.date(byAdding: .day, value: 1, to: dateCheckIn)!
            count = count + 1
        }
    
        
        if !rewardSwitch.isOn {
            reservationValueParqueFlores = parqueFlores.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: parqueFlores.weekDaysValue, weekendValues: parqueFlores.weekendValues)
            
            reservationValueJardimBotanico = jardimBotanico.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: jardimBotanico.weekDaysValue, weekendValues: jardimBotanico.weekendValues)
            
            reservationValueMarAtlantico = marAtalntico.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: marAtalntico.weekDaysValue, weekendValues: marAtalntico.weekendValues)
        } else {
            reservationValueParqueFlores = parqueFlores.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: parqueFlores.rewardClientWeekDaysValue, weekendValues: parqueFlores.rewardClientWeekendValue)
            
            reservationValueJardimBotanico = jardimBotanico.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: jardimBotanico.rewardClientWeekDaysValue, weekendValues: jardimBotanico.rewardClientWeekendValue)
            
            reservationValueMarAtlantico = marAtalntico.checkValue(weekDays: weekDays, weekends: weekends, weekDaysValue: marAtalntico.rewardClientWeekDaysValue, weekendValues: marAtalntico.rewardClientWeekendValue)
        }
        
        
        if reservationValueParqueFlores < reservationValueJardimBotanico && reservationValueParqueFlores < reservationValueMarAtlantico {
            labelBestHotel.text = parqueFlores.name
        } else if reservationValueJardimBotanico < reservationValueParqueFlores && reservationValueJardimBotanico < reservationValueMarAtlantico {
            labelBestHotel.text = jardimBotanico.name
        } else if reservationValueMarAtlantico < reservationValueParqueFlores && reservationValueMarAtlantico < reservationValueJardimBotanico {
            labelBestHotel.text = marAtalntico.name
        } else if reservationValueParqueFlores == reservationValueJardimBotanico {
            labelBestHotel.text = jardimBotanico.name
        } else if reservationValueParqueFlores == reservationValueMarAtlantico {
            labelBestHotel.text = marAtalntico.name
        } else if reservationValueJardimBotanico == reservationValueMarAtlantico {
            labelBestHotel.text = marAtalntico.name
        }
    }

}

