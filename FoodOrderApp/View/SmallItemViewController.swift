//
//  SmallItemViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 19.10.2023.
//

import UIKit

class SmallItemViewController: UIViewController {
    
    private let sampleSmallItems: [SmallListItemView] = {
        var items: [SmallListItemView] = []
        for i in 0..<3 {
            let item = SmallListItemView()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.name = Restaurant.largeItemSampleData[i].name
            item.rating = Restaurant.largeItemSampleData[i].rating
            item.ratingCount = Restaurant.largeItemSampleData[i].ratingCount
            item.restaurantType = Restaurant.largeItemSampleData[i].restaurantType
            item.foodType = Restaurant.largeItemSampleData[i].foodType
            item.image = UIImage(named: "smallItem\(i+1)")
            items.append(item)
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(sampleSmallItems[0])
        self.view.addSubview(sampleSmallItems[1])
        self.view.addSubview(sampleSmallItems[2])
        
        NSLayoutConstraint.activate([
            sampleSmallItems[0].topAnchor.constraint(equalTo: self.view.topAnchor),
            sampleSmallItems[0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleSmallItems[0].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            sampleSmallItems[1].topAnchor.constraint(equalTo: self.sampleSmallItems[0].bottomAnchor),
            sampleSmallItems[1].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleSmallItems[1].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            sampleSmallItems[2].topAnchor.constraint(equalTo: self.sampleSmallItems[1].bottomAnchor),
            sampleSmallItems[2].leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sampleSmallItems[2].trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            sampleSmallItems[2].bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
}
