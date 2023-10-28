//
//  Restaurant+FoodOrder.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 28.10.2023.
//

import Foundation

extension [Restaurant] {
    func indexOfReminder(withId id: Restaurant.ID) -> Self.Index{
        guard let index = firstIndex(where: {$0.id == id}) else {
            fatalError()
        }
        
        return index
    }
}
