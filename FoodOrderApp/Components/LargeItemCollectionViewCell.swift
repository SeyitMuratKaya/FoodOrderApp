//
//  LargeItemCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class LargeItemCollectionViewCell: UICollectionViewCell {
        
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "largeItem3")
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
        restaurantLabel.font = UIFont.boldSystemFont(ofSize: 18)
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
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.layer.cornerRadius = 10
    }
    
    private func setupSelf() {
        self.backgroundColor = .clear
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(restaurantLabel)
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(HStackView)
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(cafeType)
        cafeType.translatesAutoresizingMaskIntoConstraints = false
        
        HStackView.addArrangedSubview(cafeRating)
        cafeRating.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            
            restaurantLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            restaurantLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            HStackView.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 5),
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    func setup(restaurant: Restaurant) {
        restaurantLabel.text = restaurant.name
        cafeRating.rating = restaurant.rating
        cafeRating.totalRating = restaurant.ratingCount
        cafeType.restaurantType = restaurant.restaurantType
        cafeType.foodType = restaurant.foodType
        imageView.image = UIImage(named: restaurant.image)
    }

}

extension LargeItemCollectionViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 0.5
            }, completion: nil)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
}

