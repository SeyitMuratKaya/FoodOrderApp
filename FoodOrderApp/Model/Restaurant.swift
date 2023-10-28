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
