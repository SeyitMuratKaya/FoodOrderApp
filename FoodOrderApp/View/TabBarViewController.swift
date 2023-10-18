//
//  TabBarViewController.swift
//  FoodOrderApp
//
//  Created by Seyit Murat Kaya on 18.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let middleButton : UIButton = {
        let middleButton = UIButton()
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)
        if let image = UIImage(systemName: "house.fill", withConfiguration: config) {
            middleButton.setImage(image, for: .normal)
        }
        middleButton.tintColor = .white
        middleButton.backgroundColor = UIColor.orange
        middleButton.layer.cornerRadius = 30
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        return middleButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.tabBar.addSubview(middleButton)
        addTabItems()
        setupTabBar()
        middleButton.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 30, y: -30, width: 60, height: 60)
    }
    
    private func addTabItems() {
        let tab1 = ViewController()
        let tab2 = ViewController()
        let tab3 = ViewController()
        let tab4 = ViewController()
        let tab5 = ViewController()
        tab1.title = "Menu"
        tab2.title = "Offers"
        tab3.title = ""
        tab4.title = "Profile"
        tab5.title = "More"
        setViewControllers([tab1, tab2, tab3, tab4, tab5], animated: false)
        guard let items = tabBar.items else { return}
        items[0].image = UIImage(systemName: "square.grid.2x2.fill")
        items[1].image = UIImage(systemName: "bag.fill")
        items[2].isEnabled = false
        items[3].image = UIImage(systemName: "person.fill")
        items[4].image = UIImage(systemName: "list.bullet")
    }
    
    private func setupTabBar() {
        let path : UIBezierPath = createPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
        self.tabBar.tintColor = UIColor(named: "Header")
        self.tabBar.backgroundColor = UIColor.clear
        self.tabBar.unselectedItemTintColor = UIColor(named: "PaleGray")
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.tabBar.layer.shadowRadius = 10.0
    }
    
    func createPath() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 20
        let holeWidth = 150
        let holeHeight = 45
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        
        let path : UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole , y: 0)) // 1.Line
        
        path.addArc(withCenter: CGPoint(x: leftXUntilHole + (holeWidth / 2), y: 0), radius: CGFloat(holeHeight), startAngle: CGFloat(Float.pi), endAngle: CGFloat(2*Float.pi), clockwise: false)
        
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: view.frame.maxY)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: view.frame.maxY)) // 5. Line
        path.close()
        return path
    }
    
}
