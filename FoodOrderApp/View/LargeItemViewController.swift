//
//  LargeItemViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 19.10.2023.
//

import UIKit

class LargeItemViewController: UIViewController {
    
    private let popularRestaurantsHeader: ListHeaderView = {
        let popularRestaurantsHeader = ListHeaderView()
        popularRestaurantsHeader.translatesAutoresizingMaskIntoConstraints = false
        popularRestaurantsHeader.text = "Popular Restaurants"
        return popularRestaurantsHeader
    }()
    
    private let sampleLargeItems: [LargeListItemView] = {
        var items: [LargeListItemView] = []
        for i in 0..<3 {
            let item = LargeListItemView()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.name = Restaurant.largeItemSampleData[i].name
            item.rating = Restaurant.largeItemSampleData[i].rating
            item.ratingCount = Restaurant.largeItemSampleData[i].ratingCount
            item.restaurantType = Restaurant.largeItemSampleData[i].restaurantType
            item.foodType = Restaurant.largeItemSampleData[i].foodType
            item.image = UIImage(named: "largeItem\(i+1)")
            items.append(item)
        }
        return items
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view .addSubview(popularRestaurantsHeader)
        self.view.addSubview(sampleLargeItems[0])
        self.view.addSubview(sampleLargeItems[1])
        self.view.addSubview(sampleLargeItems[2])
        
        NSLayoutConstraint.activate([
            
            popularRestaurantsHeader.topAnchor.constraint(equalTo: self.view.topAnchor),
            popularRestaurantsHeader.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            popularRestaurantsHeader.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            popularRestaurantsHeader.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            sampleLargeItems[0].topAnchor.constraint(equalTo: self.popularRestaurantsHeader.bottomAnchor),
            sampleLargeItems[0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleLargeItems[0].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sampleLargeItems[0].heightAnchor.constraint(equalToConstant: 300),
            
            sampleLargeItems[1].topAnchor.constraint(equalTo: self.sampleLargeItems[0].bottomAnchor),
            sampleLargeItems[1].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleLargeItems[1].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sampleLargeItems[1].heightAnchor.constraint(equalToConstant: 300),
            
            sampleLargeItems[2].topAnchor.constraint(equalTo: self.sampleLargeItems[1].bottomAnchor),
            sampleLargeItems[2].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleLargeItems[2].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sampleLargeItems[2].heightAnchor.constraint(equalToConstant: 300),
            
            sampleLargeItems[2].bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
