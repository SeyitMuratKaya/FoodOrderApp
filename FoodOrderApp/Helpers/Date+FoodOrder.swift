//
//  Date+FoodOrder.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 18.10.2023.
//

import Foundation

extension Date {
    func timeOfDayGreeting() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        case 17..<21:
            return "Good Evening"
        default:
            return "Good Night"
        }
    }
}
