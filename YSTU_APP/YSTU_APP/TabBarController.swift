//
//  TabBarController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    init(controllers: [UINavigationController]) {
        super.init(nibName: nil, bundle: nil)
        controllers.forEach { self.addChild($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
