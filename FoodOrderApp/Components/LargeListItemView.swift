//
//  LargeListItemView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class LargeListItemView: UIView {
    
    public var name: String? {
        didSet {
            if let name {
                restaurantLabel.text = name
            }
        }
    }
    
    public var rating: Double? {
        didSet {
            if let rating {
                cafeRating.rating = rating
            }
        }
    }
    
    public var ratingCount: Int? {
        didSet {
            if let ratingCount {
                cafeRating.totalRating = ratingCount
            }
        }
    }
    
    public var restaurantType: String? {
        didSet {
            if let restaurantType {
                cafeType.restaurantType = restaurantType
            }
        }
    }
    
    public var foodType: String? {
        didSet {
            if let foodType {
                cafeType.foodType = foodType
            }
        }
    }
    
    
    public var image: UIImage? {
        didSet {
            if let image {
                imageView.image = image
            }
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "largeItem2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let HStackView: UIStackView = {
        let HStackView = UIStackView()
        HStackView.axis = .horizontal
        HStackView.alignment = .center
        HStackView.distribution = .fillProportionally
        return HStackView
    }()
    
    private let VStackView: UIStackView = {
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillProportionally
        return VStackView
    }()
    
    private let innerVStackView: UIStackView = {
        let innerVStackView = UIStackView()
        innerVStackView.axis = .vertical
        innerVStackView.distribution = .fillProportionally
        return innerVStackView
    }()
    
    private let restaurantLabel: UILabel = {
        let restaurantLabel = UILabel()
        restaurantLabel.text = "Cafe de Noir"
        restaurantLabel.font = UIFont.boldSystemFont(ofSize: 16)
        restaurantLabel.textColor = UIColor(named: "Header")
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false

        self.VStackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.VStackView.addArrangedSubview(innerVStackView)
        innerVStackView.translatesAutoresizingMaskIntoConstraints = false

        self.innerVStackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.innerVStackView.addArrangedSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.HStackView.addArrangedSubview(cafeRating)
        cafeRating.translatesAutoresizingMaskIntoConstraints = false
        
        self.HStackView.addArrangedSubview(cafeType)
        cafeType.translatesAutoresizingMaskIntoConstraints = false
        
        innerVStackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 8)
        innerVStackView.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            VStackView.topAnchor.constraint(equalTo: topAnchor),
            VStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
