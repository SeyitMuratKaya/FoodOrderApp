//
//  ViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var foodCategoryLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var popularRestaurantsLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var foodCategoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.foodCategoryLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var popularRestaurantsCollectionView: UICollectionView = {
        let popularRestaurantsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.popularRestaurantsLayout)
        popularRestaurantsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        popularRestaurantsCollectionView.showsHorizontalScrollIndicator = false
        popularRestaurantsCollectionView.isUserInteractionEnabled = true
        popularRestaurantsCollectionView.isScrollEnabled = true
        popularRestaurantsCollectionView.backgroundColor = .white
        return popularRestaurantsCollectionView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemRed
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let welcomeHeader: WelcomeHeaderView = {
        let welcomeHeader = WelcomeHeaderView()
        welcomeHeader.translatesAutoresizingMaskIntoConstraints = false
        return welcomeHeader
    }()
    
    private let searchBar: SearchBarView = {
        let searchBar = SearchBarView()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let locationSelector: LocationSelectorView = {
        let locationSelector = LocationSelectorView()
        locationSelector.translatesAutoresizingMaskIntoConstraints = false
        return locationSelector
    }()
    
    private let sampleLargeItems: [LargeListItemView] = {
        var items: [LargeListItemView] = []
        for x in 0..<3 {
            let iv = LargeListItemView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            items.append(iv)
        }
        return items
    }()
    
    private let sampleSmallItems: [SmallListItemView] = {
        var items: [SmallListItemView] = []
        for x in 0..<3 {
            let iv = SmallListItemView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            items.append(iv)
        }
        return items
    }()
    
    private let sampleHeader1: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        sampleHeader.translatesAutoresizingMaskIntoConstraints = false
        return sampleHeader
    }()
    
    private let sampleHeader2: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        sampleHeader.translatesAutoresizingMaskIntoConstraints = false
        return sampleHeader
    }()
    
    private let sampleHeader3: ListHeaderView = {
        let sampleHeader = ListHeaderView()
        sampleHeader.translatesAutoresizingMaskIntoConstraints = false
        return sampleHeader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        popularRestaurantsCollectionView.delegate = self
        popularRestaurantsCollectionView.dataSource = self
        foodCategoryCollectionView.register(SmallItemCollectionViewCell.self, forCellWithReuseIdentifier: "smallItem")
        popularRestaurantsCollectionView.register(LargeItemCollectionViewCell.self, forCellWithReuseIdentifier: "largeItem")
        self.setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(contentView)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
        
        self.contentView.addSubview(welcomeHeader)
        self.contentView.addSubview(locationSelector)
        self.contentView.addSubview(searchBar)
        self.contentView.addSubview(foodCategoryCollectionView)
        self.contentView.addSubview(sampleHeader1)
        self.contentView.addSubview(sampleLargeItems[0])
        self.contentView.addSubview(sampleLargeItems[1])
        self.contentView.addSubview(sampleLargeItems[2])
        self.contentView.addSubview(sampleHeader3)
        self.contentView.addSubview(popularRestaurantsCollectionView)
        self.contentView.addSubview(sampleHeader2)
        self.contentView.addSubview(sampleSmallItems[0])
        self.contentView.addSubview(sampleSmallItems[1])
        self.contentView.addSubview(sampleSmallItems[2])
        
        
        NSLayoutConstraint.activate([
            
            welcomeHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            welcomeHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            welcomeHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            welcomeHeader.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            locationSelector.topAnchor.constraint(equalTo: welcomeHeader.bottomAnchor),
            locationSelector.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            locationSelector.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            locationSelector.heightAnchor.constraint(equalToConstant: 50),
            
            searchBar.topAnchor.constraint(equalTo: locationSelector.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            foodCategoryCollectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 16),
            foodCategoryCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            foodCategoryCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            foodCategoryCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            sampleHeader1.topAnchor.constraint(equalTo: self.foodCategoryCollectionView.bottomAnchor),
            sampleHeader1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleHeader1.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[0].topAnchor.constraint(equalTo: self.sampleHeader1.bottomAnchor),
            sampleLargeItems[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[0].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[1].topAnchor.constraint(equalTo: self.sampleLargeItems[0].bottomAnchor),
            sampleLargeItems[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[1].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleLargeItems[2].topAnchor.constraint(equalTo: self.sampleLargeItems[1].bottomAnchor),
            sampleLargeItems[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleLargeItems[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleLargeItems[2].heightAnchor.constraint(equalToConstant: 300),
            sampleLargeItems[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleHeader3.topAnchor.constraint(equalTo: self.sampleLargeItems[2].bottomAnchor),
            sampleHeader3.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader3.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleHeader3.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            popularRestaurantsCollectionView.topAnchor.constraint(equalTo: self.sampleHeader3.bottomAnchor),
            popularRestaurantsCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            popularRestaurantsCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            popularRestaurantsCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            sampleHeader2.topAnchor.constraint(equalTo: self.popularRestaurantsCollectionView.bottomAnchor),
            sampleHeader2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleHeader2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleHeader2.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[0].topAnchor.constraint(equalTo: self.sampleHeader2.bottomAnchor),
            sampleSmallItems[0].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[0].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[0].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[1].topAnchor.constraint(equalTo: self.sampleSmallItems[0].bottomAnchor),
            sampleSmallItems[1].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[1].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[1].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[2].topAnchor.constraint(equalTo: self.sampleSmallItems[1].bottomAnchor),
            sampleSmallItems[2].leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            sampleSmallItems[2].trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            sampleSmallItems[2].widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            sampleSmallItems[2].bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.foodCategoryCollectionView{
            return CGSize(width: 88, height: 113)
        }else if collectionView == self.popularRestaurantsCollectionView {
            return CGSize(width: 228, height: 185)
        }
        return CGSize(width: 88, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.foodCategoryCollectionView{
            return 10
        }else if collectionView == self.popularRestaurantsCollectionView {
            return 3
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.foodCategoryCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallItem", for: indexPath) as? SmallItemCollectionViewCell else {return UICollectionViewCell()}
            return cell
        }else if collectionView == self.popularRestaurantsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "largeItem", for: indexPath) as? LargeItemCollectionViewCell else {return UICollectionViewCell()}
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//#Preview{
//    ViewController()
//}
