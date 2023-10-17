//
//  LocationSelectorView.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 17.10.2023.
//

import UIKit

class LocationSelectorView: UIView {
    
    private let topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Delivering to"
        topLabel.textColor = UIColor(red: 0.714, green: 0.718, blue: 0.718, alpha: 1)
        topLabel.font = UIFont.systemFont(ofSize: 11)
        return topLabel
    }()
    
    private let locationSelector: UILabel = {
        let locationSelector = UILabel()
        locationSelector.translatesAutoresizingMaskIntoConstraints = false
        locationSelector.text = "Current Location"
        locationSelector.textColor = UIColor(red: 0.486, green: 0.49, blue: 0.494, alpha: 1)
        locationSelector.sizeToFit()
        locationSelector.font = UIFont.boldSystemFont(ofSize: 16)
        return locationSelector
    }()
    
    private let selectionButton: UIButton = {
        let selectionButton = UIButton()
        selectionButton.translatesAutoresizingMaskIntoConstraints = false
        selectionButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        selectionButton.tintColor = UIColor(red: 0.988, green: 0.376, blue: 0.067, alpha: 1)
        return selectionButton
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
        self.addSubview(topLabel)
        self.addSubview(locationSelector)
        self.addSubview(selectionButton)
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationSelector.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            locationSelector.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            selectionButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            selectionButton.leadingAnchor.constraint(equalTo: locationSelector.trailingAnchor),
            selectionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectionButton.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
