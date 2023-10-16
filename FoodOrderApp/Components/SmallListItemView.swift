//
//  SmallListItemView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class SmallListItemView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smallItem1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let restaurantLabel: UILabel = {
        let restaurantLabel = UILabel()
        restaurantLabel.text = "Cafe de Noir"
        restaurantLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        restaurantLabel.textColor = UIColor(red: 0.29, green: 0.294, blue: 0.302, alpha: 1)
        return restaurantLabel
    }()
        
    private let cafeRating: CafeRatingView = {
        let cafeRating = CafeRatingView()
        cafeRating.rating = 4.9
        cafeRating.totalRating = 124
        return cafeRating
    }()
    
    private let cafeType: CafeTypeView = {
        let cafeType = CafeTypeView()
        cafeType.restaurantType = "Cafe"
        cafeType.foodType = "Western Food"
        return cafeType
    }()
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .leading
        HStackView.distribution = .fillProportionally
        return HStackView
    }()
    
    private let VStackView: UIStackView = {
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillEqually
        return VStackView
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
        self.addSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(cafeType)
        cafeType.translatesAutoresizingMaskIntoConstraints = false
        
        VStackView.addArrangedSubview(cafeRating)
        cafeType.translatesAutoresizingMaskIntoConstraints = false
        
        
        HStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        HStackView.isLayoutMarginsRelativeArrangement = true
        
        VStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 16)
        VStackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            HStackView.topAnchor.constraint(equalTo: topAnchor),
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            VStackView.heightAnchor.constraint(equalToConstant: 75),
            
            imageView.heightAnchor.constraint(equalToConstant: 75),
            imageView.widthAnchor.constraint(equalToConstant: 75)
        ])
        
    }

}
