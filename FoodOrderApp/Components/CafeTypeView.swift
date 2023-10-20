//
//  CafeTypeView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class CafeTypeView: UIView {
    
    public var restaurantType: String? {
        didSet {
            restaurantTypeLabel.text = restaurantType
        }
    }
    
    public var foodType: String? {
        didSet {
            foodTypeLabel.text = foodType
        }
    }
    
    public var restaurantTypeLabel: UILabel = {
        let restaurantTypeLabel = UILabel()
        restaurantTypeLabel.font = UIFont.systemFont(ofSize: 12)
        restaurantTypeLabel.textColor = UIColor(named: "PaleGray")
        return restaurantTypeLabel
    }()
    
    public var foodTypeLabel: UILabel = {
        let foodTypeLable = UILabel()
        foodTypeLable.font = UIFont.systemFont(ofSize: 12)
        foodTypeLable.textColor = UIColor(named: "PaleGray")
        return foodTypeLable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(restaurantTypeLabel)
        restaurantTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(foodTypeLabel)
        foodTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            restaurantTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantTypeLabel.topAnchor.constraint(equalTo: topAnchor),
            restaurantTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            foodTypeLabel.leadingAnchor.constraint(equalTo: restaurantTypeLabel.trailingAnchor, constant: 4),
            foodTypeLabel.centerYAnchor.constraint(equalTo: restaurantTypeLabel.centerYAnchor),
        ])
    }
    
}
