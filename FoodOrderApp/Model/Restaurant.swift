//
//  Restaurant.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 18.10.2023.
//

import Foundation

struct Restaurant: Equatable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var image: String
    var rating: Double
    var ratingCount: Int
    var restaurantType: String
    var foodType: String
}

extension [Restaurant] {
    func indexOfReminder(withId id: Restaurant.ID) -> Self.Index{
        guard let index = firstIndex(where: {$0.id == id}) else {
            fatalError()
        }
        
        return index
    }
    
}

extension Restaurant {
    static var largeItemSampleData = [
        Restaurant(name: "Minute By Tuk Tuk", image: "largeItem1", rating: 4.9, ratingCount: 124, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Cafe de Noir", image: "largeItem2", rating: 4.5, ratingCount: 20, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Bakes By Tella", image: "largeItem3", rating: 4.3, ratingCount: 34, restaurantType: "Bakery", foodType: "Western Food"),
    ]
    
    static var smallItemSampleData = [
        Restaurant(name: "Mulberry Pizza By Josh", image: "smallItem1", rating: 4.4, ratingCount: 70, restaurantType: "Pizzaria", foodType: "Western Food"),
        Restaurant(name: "Barita", image: "smallItem2", rating: 3.0, ratingCount: 12, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Pizza Rush Hour", image: "smallItem3", rating: 4.6, ratingCount: 234, restaurantType: "Pizzaria", foodType: "Western Food"),
    ]
}
