//
//  Sample+Restaurant.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 28.10.2023.
//

import Foundation

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
    
    static var smallCellSampleData = [
        Restaurant(name: "Offers", image: "smallScroll1", rating: 4.4, ratingCount: 70, restaurantType: "Pizzaria", foodType: "Western Food"),
        Restaurant(name: "Sri Lankan", image: "smallScroll2", rating: 3.0, ratingCount: 12, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Italian", image: "smallScroll3", rating: 4.6, ratingCount: 234, restaurantType: "Pizzaria", foodType: "Western Food"),
        Restaurant(name: "Indian", image: "smallScroll4", rating: 4.4, ratingCount: 70, restaurantType: "Pizzaria", foodType: "Western Food"),
        Restaurant(name: "French", image: "smallScroll5", rating: 3.0, ratingCount: 12, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Chinese", image: "smallScroll6", rating: 4.6, ratingCount: 234, restaurantType: "Pizzaria", foodType: "Western Food"),
    ]
    
    static var largeCellSampleData = [
        Restaurant(name: "Cafe de Bamba", image: "largeScroll1", rating: 4.9, ratingCount: 124, restaurantType: "Cafe", foodType: "Western Food"),
        Restaurant(name: "Burger By Bella", image: "largeScroll1", rating: 4.5, ratingCount: 20, restaurantType: "Cafe", foodType: "Western Food"),
    ]
}
