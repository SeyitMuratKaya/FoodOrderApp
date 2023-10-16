//
//  CafeRatingView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class CafeRatingView: UIView {
    
    public var rating: Double? {
        didSet {
            if let rating {
                ratingPoint.text = "\(String(describing: rating))"
            }
        }
    }
    
    public var totalRating: Int? {
        didSet {
            if let totalRating {
                ratingCount.text = "(\(String(describing: totalRating))) ratings"
            }
        }
    }
    
    private let starImage: UIImageView = {
        let starImage = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 14)
        starImage.image = UIImage(systemName: "star.fill",withConfiguration: config)
        starImage.tintColor = UIColor(red: 0.988, green: 0.376, blue: 0.067, alpha: 1)
        return starImage
    }()
    
    private var ratingPoint: UILabel = {
        let ratingPoint = UILabel()
        ratingPoint.font = UIFont.boldSystemFont(ofSize: 12)
        ratingPoint.textColor = UIColor(red: 0.988, green: 0.376, blue: 0.067, alpha: 1)
        return ratingPoint
    }()
    
    private var ratingCount: UILabel = {
        let ratingCount = UILabel()
        ratingCount.font = UIFont.systemFont(ofSize: 12)
        ratingCount.textColor = UIColor(red: 0.714, green: 0.718, blue: 0.718, alpha: 1)
        return ratingCount
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
        self.addSubview(starImage)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(ratingPoint)
        ratingPoint.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(ratingCount)
        ratingCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            starImage.topAnchor.constraint(equalTo: topAnchor),
            starImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ratingPoint.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 4),
            ratingPoint.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            
            ratingCount.leadingAnchor.constraint(equalTo: ratingPoint.trailingAnchor, constant: 4),
            ratingCount.centerYAnchor.constraint(equalTo: ratingPoint.centerYAnchor)
        ])
    }
}
