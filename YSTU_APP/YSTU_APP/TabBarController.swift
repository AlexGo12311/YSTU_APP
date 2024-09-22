//
//  TabBarController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private var isTabBarCustomized = false
    
    init(controllers: [UINavigationController]) {
        super.init(nibName: nil, bundle: nil)
        controllers.forEach { self.addChild($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !isTabBarCustomized {
            tabBar.setCustomStyle()
            isTabBarCustomized = true
        }
    }
}


private extension UITabBar {
    func setCustomStyle() {
        let appearence = UITabBarAppearance()
        
        // Настраиваем цвет для выбранных и невыбранных элементов через appearance
        appearence.stackedLayoutAppearance.selected.iconColor = AccentColors.selectedColor
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AccentColors.selectedColor]

        appearence.stackedLayoutAppearance.normal.iconColor = AccentColors.normalColor
        appearence.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.font: UIFont.Montserrat.SemiBold.size(of: 10), .foregroundColor: AccentColors.normalColor]
        
        appearence.backgroundColor = AccentColors.tabBarColor
        self.scrollEdgeAppearance = appearence
        self.standardAppearance = appearence
        
        self.layer.cornerRadius = 24
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.masksToBounds = true
        
        let shadowLayer = CALayer()
        shadowLayer.frame = self.frame
        shadowLayer.cornerRadius = self.layer.cornerRadius
        shadowLayer.backgroundColor = UIColor.systemBackground.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer.shadowRadius = 10
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.05
        
        if let superview = self.superview {
            superview.layer.insertSublayer(shadowLayer, below: self.layer)
        }
        
        self.itemPositioning = .centered
        self.itemWidth = 70
    }
}


