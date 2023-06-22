//
//  ObjectiveModel.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import Foundation

struct ObjectiveEntity {
    var name: String
    var initialDate: Date
    var finalDate: Date
    var completeDays: Int
    var goalValue: Double
    var goalStatus: Bool
    var frequency: String
    var isCurrent: Bool
    var savedValue: Double
    var value: Double
    
    static func calulateValue(deadline: Date, objective: Double, frequency: Frequency, goalStatus: Bool) -> Double {
        
        // pega a data atual
        let dateActual = Date()
        
        let calendar = NSCalendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: dateActual)
        let date2 = calendar.startOfDay(for: deadline)

        let components = calendar.dateComponents([.day], from: date1, to: date2)

        var dayDifference = components.day ?? 0
        dayDifference += 1
 
        var goal = Double()
        switch frequency {
        case .daily:
            if goalStatus == true {
                dayDifference -= 1
            }
            goal = objective/Double(dayDifference)
        case .weekly:
            if goalStatus == true {
                dayDifference -= 7
            }
            let week: Int = Int(dayDifference/7)
            goal = week == 0 ? objective : objective/Double(week)
        case .monthly:
            if goalStatus == true {
                dayDifference -= 30
            }
            let moth: Int = Int(dayDifference/30)
            goal = moth == 0 ? objective : objective/Double(moth)
        }
        
        return goal
    }
    
}
