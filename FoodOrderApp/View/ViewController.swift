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
        scrollView.backgroundColor = .white
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
            
    
    private let mostPopularHeader: ListHeaderView = {
        let mostPopularHeader = ListHeaderView()
        mostPopularHeader.translatesAutoresizingMaskIntoConstraints = false
        mostPopularHeader.text = "Most Popular"
        return mostPopularHeader
    }()
        
    let largeItemsVC: LargeItemViewController = {
        let largeItemsVC = LargeItemViewController()
        largeItemsVC.view.translatesAutoresizingMaskIntoConstraints = false
        return largeItemsVC
    }()
    
    let smallItemsVC: SmallItemViewController = {
        let smallItemsVC = SmallItemViewController()
        smallItemsVC.view.translatesAutoresizingMaskIntoConstraints = false
        return smallItemsVC
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
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(contentView)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
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
        
        addChild(largeItemsVC)
        self.contentView.addSubview(largeItemsVC.view)
        self.largeItemsVC.didMove(toParent: self)
        
        self.contentView.addSubview(mostPopularHeader)
        self.contentView.addSubview(popularRestaurantsCollectionView)
        
        addChild(smallItemsVC)
        self.contentView.addSubview(smallItemsVC.view)
        self.smallItemsVC.didMove(toParent: self)
        
        
        NSLayoutConstraint.activate([
            
            welcomeHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            welcomeHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            welcomeHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
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
            
            largeItemsVC.view.topAnchor.constraint(equalTo: self.foodCategoryCollectionView.bottomAnchor),
            largeItemsVC.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            largeItemsVC.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            largeItemsVC.view.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            mostPopularHeader.topAnchor.constraint(equalTo: self.largeItemsVC.view.bottomAnchor),
            mostPopularHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mostPopularHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            mostPopularHeader.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            popularRestaurantsCollectionView.topAnchor.constraint(equalTo: self.mostPopularHeader.bottomAnchor),
            popularRestaurantsCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            popularRestaurantsCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            popularRestaurantsCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            smallItemsVC.view.topAnchor.constraint(equalTo: self.popularRestaurantsCollectionView.bottomAnchor),
            smallItemsVC.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            smallItemsVC.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            smallItemsVC.view.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            smallItemsVC.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
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
            return Restaurant.smallCellSampleData.count
        }else if collectionView == self.popularRestaurantsCollectionView {
            return Restaurant.largeCellSampleData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.foodCategoryCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smallItem", for: indexPath) as? SmallItemCollectionViewCell else {return UICollectionViewCell()}
            cell.name = Restaurant.smallCellSampleData[indexPath.row].name
            cell.image = UIImage(named: Restaurant.smallCellSampleData[indexPath.row].image)
            return cell
        }else if collectionView == self.popularRestaurantsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "largeItem", for: indexPath) as? LargeItemCollectionViewCell else {return UICollectionViewCell()}
            cell.name = Restaurant.largeItemSampleData[indexPath.row].name
            cell.rating = Restaurant.largeItemSampleData[indexPath.row].rating
            cell.ratingCount = Restaurant.largeItemSampleData[indexPath.row].ratingCount
            cell.restaurantType = Restaurant.largeItemSampleData[indexPath.row].restaurantType
            cell.foodType = Restaurant.largeItemSampleData[indexPath.row].foodType
            cell.image = UIImage(named: Restaurant.largeCellSampleData[indexPath.row].image)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//#Preview{
//    ViewController()
//}
